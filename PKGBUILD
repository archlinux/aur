# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_port=9001
pkgname=minima-bin
pkgver=0.103.10
pkgrel=1
pkgdesc='A completely decentralized network for information and value transfer'
arch=(any)
url='https://github.com/minima-global/Minima'
license=('Apache-2.0')
depends=('jre-openjdk-headless')
makedepends=('git')
source=(
    'https://github.com/minima-global/Minima/raw/master/jar/minima.jar'
    'minima.conf'
    'minima.sysusers'
    'minima.tmpfiles'
    'minima@.service'
)
sha512sums=(
    '8b3cf96c444c3e0501423d01a5db028e8e9050fb3f3454c6ddd92775ec1240a6611ccd6814b7605b43afb77166af4861a69265e728832e5140abe7545dc2709c'
    'c1dc29ed6b7fe84bad8e4d61737b5f47ef231bf27bdd5ebcb3db409e5ca994281d881f7840a37bf5c1667e1cbeba80628dea7e9af5afe4ff84160db028c38033'
    'eff286fa2f722bb1de82898a2552aa726c97f7fb9558426dad6802749bcd00792140b703e73da4491b85f883d92b8a8c6ffbb4ebf77a14d9cadbdad2e8af1e77'
    '8f7de769d1c382bdcf6f0560bfe8bac53295ede13c0f01dbbca2395bb0d828adc4200c60579c1bd9f9f6ba499a0940a0b344194cfc47b6500f333798c2bacc78'
    '7b5b4e4a9259d15eb8bb4a8623c2c3410c8707a611eb6d726a0eab6743616b578da966f92b249ffd66f38c7270a00fa7be0f8cd30c5d95a97bc609a6b2bebad6'
)
options=(!strip)
install='minima.install'
backup=("etc/minima/minima-$_port.conf")

package() {
    install -Dm644 minima.conf "$pkgdir/etc/minima/minima-$_port.conf"
    install -Dm644 minima.sysusers "$pkgdir/usr/lib/sysusers.d/minima.conf"
    install -Dm644 minima.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/minima.conf"
    install -Dm644 minima@.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm755 minima.jar -t "$pkgdir/usr/bin"
}

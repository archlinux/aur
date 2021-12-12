# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_port=9001
pkgname=minima-bin
pkgver=0.100.25
pkgrel=2
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
    'ac9691f9142f1384ba07d98e89c222c036b5d40a511e584aa7dafb702353da2b5eb9810cb697231a43c5f198becb342809c2e0a274f385fab7ac296bc76b62d5'
    '9554ac28c5a1285d46cb0e73fada7bf31e09c867e3732d53bcb3c1e02c27a01f573fd83ba161e98988331c54ab770398228c4837bccfa6e099c432e2f1184e77'
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

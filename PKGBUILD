# Maintainer: Mekyt <hello at mek dot yt>

_pkgname='oathkeeper'
pkgname='oathkeeper-bin'
pkgver=0.40.6
pkgrel=1
pkgdesc='Ory oathkeeper identity and access proxy'
arch=('x86_64')
url='https://github.com/ory/oathkeeper'
license=('Apache 2.0')
depends=()
makedepends=()
optdepends=()
source=(
    "${_pkgname}-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-linux_64bit.tar.gz"
    'config.yml'
    "${_pkgname}.service"
    "${_pkgname}.sysusers"
)
backup=('etc/oathkeeper/config.yml')
sha512sums=('50ddaf7a53395c44fb3993b95b5de82c4d185e82fe312960f79b1c6b25ca57208d959389ba417ed48cb9e0bf48b7938b951d0b061b400ff7d515dd5db3dfed80'
            'a62ab238d4121ad7a07fef2b39bd432aea9b53a40883f59325ac23d1d46d17d7fb9184f8ff81e38760ba03cdac0b6026ca4f61fcc74e2ec0a4ddec1778fb0d05'
            '881bea04c65677b881a4561c1cfa2ed11d5e9eab839ed7f2b87d49033e9531c52cf07e28baf4e24ae147f93497fee0c2ab9015b3d870fded308b0f14bf28fc4b'
            'f7e73a1ae1514cc500106c1609a3a17de11f374a25145b5b552b8c02e5a059a19c84154bf89aff4ff50fc47dd3563a9d4c339a5eab7b8fc5db91f51f044b42d5')

package() {
    install -Dm755 ${srcdir}/${_pkgname} -t "${pkgdir}"/usr/bin/
    install -Dm644 ${_pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
    install -Dm644 config.yml "${pkgdir}"/etc/oathkeeper/config.yml
}

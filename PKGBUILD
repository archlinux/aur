# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=geesefs
pkgname=$_pkgbin-bin
pkgdesc="A high-performance, POSIX-ish S3 (Yandex, Amazon) file system written in Go."
license=("Apache")
url="https://github.com/yandex-cloud/geesefs"
pkgver="0.43.8"
pkgrel=1
arch=("x86_64")
depends=("fuse3")
provides=("$_pkgbin")
conflicts=("$_pkgbin" "$_pkgbin-git")
_pkgsrc="geesefs-linux-amd64"
source=("${_pkgsrc}-${pkgver}-${pkgrel}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
        "LICENSE::https://raw.githubusercontent.com/yandex-cloud/geesefs/v${pkgver}/LICENSE")
sha512sums=('41713c31555d8b75e7a1e9fb52f9870f4a8558f2e300a9cfee3aba049f6559f92b04fc55d1b50fe0d000248eb049668e1f6ffa3e1f16c5d8f755b1dd5ba00714'
            '34e066f8925ff51a4164d55d8ae3fd390fc2fd0d4bdf4ddc599f21a815e8886401cf95385b4c18d97276f4d3aee0ec323be3adf1b7fc773a192e31147d0a06da')


package() {
  # Install License
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # Install Binary
  install -Dm755 ${_pkgsrc}-${pkgver}-${pkgrel} ${pkgdir}/usr/bin/$_pkgbin
}

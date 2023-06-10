# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=geesefs
pkgname=$_pkgbin-bin
pkgdesc="A high-performance, POSIX-ish S3 (Yandex, Amazon) file system written in Go."
license=("Apache")
url="https://github.com/yandex-cloud/geesefs"
pkgver="0.36.1"
pkgrel=2
arch=("x86_64")
depends=("fuse3")
provides=("$_pkgbin")
conflicts=("$_pkgbin" "$_pkgbin-git")
_pkgsrc="geesefs-linux-amd64"
source=("${_pkgsrc}-${pkgver}-${pkgrel}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
        "LICENSE::https://raw.githubusercontent.com/yandex-cloud/geesefs/v${pkgver}/LICENSE")
sha512sums=("3af2e33f9296b599922ffa06ac4e284972da7150c11b58b93e3085ef17f07dcfe4c5aafac5b263081d64645ad06c22a3c6a001e85f71cc38ece125838e91f239"
            "34e066f8925ff51a4164d55d8ae3fd390fc2fd0d4bdf4ddc599f21a815e8886401cf95385b4c18d97276f4d3aee0ec323be3adf1b7fc773a192e31147d0a06da")


package() {
  # Install License
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # Install Binary
  install -Dm755 ${_pkgsrc}-${pkgver}-${pkgrel} ${pkgdir}/usr/bin/$_pkgbin
}

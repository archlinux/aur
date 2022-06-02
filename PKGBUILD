# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=geesefs
pkgname=$_pkgbin-bin
pkgdesc="A high-performance, POSIX-ish S3 (Yandex, Amazon) file system written in Go."
license=("Apache")
url="https://github.com/yandex-cloud/geesefs"
pkgver="0.31.2"
pkgrel=1
arch=("x86_64")
depends=("fuse3")
provides=("$_pkgbin")
conflicts=("$_pkgbin" "$_pkgbin-git")
_pkgsrc="geesefs-linux-amd64"
source=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
        "LICENSE::https://raw.githubusercontent.com/yandex-cloud/geesefs/v${pkgver}/LICENSE")
sha512sums=("bd3d4d78ceacf36a4aad565846c1951d46d46794589bf1aa8eb9b673fda5f375c174ffab018b68ee3b79b738d53862e39fe4f3a03018101ec14b80d2e6256835"
            "34e066f8925ff51a4164d55d8ae3fd390fc2fd0d4bdf4ddc599f21a815e8886401cf95385b4c18d97276f4d3aee0ec323be3adf1b7fc773a192e31147d0a06da")


package() {
  # Install License
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # Install Binary
  install -Dm755 geesefs-linux-amd64 ${pkgdir}/usr/bin/$_pkgbin
}

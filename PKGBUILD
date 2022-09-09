# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=geesefs
pkgname=$_pkgbin-bin
pkgdesc="A high-performance, POSIX-ish S3 (Yandex, Amazon) file system written in Go."
license=("Apache")
url="https://github.com/yandex-cloud/geesefs"
pkgver="0.31.8"
pkgrel=1
arch=("x86_64")
depends=("fuse3")
provides=("$_pkgbin")
conflicts=("$_pkgbin" "$_pkgbin-git")
_pkgsrc="geesefs-linux-amd64"
source=("${_pkgsrc}-${pkgver}-${pkgrel}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
        "LICENSE::https://raw.githubusercontent.com/yandex-cloud/geesefs/v${pkgver}/LICENSE")
sha512sums=("d324ccc60833c051f465d1f81b6311d8fc29dab2c4bb5521bd03024760b282a729d55d3516e29a5a05f6915d5fa46dee3dec4954fef566d7115d5d95a7ae23ff"
            "34e066f8925ff51a4164d55d8ae3fd390fc2fd0d4bdf4ddc599f21a815e8886401cf95385b4c18d97276f4d3aee0ec323be3adf1b7fc773a192e31147d0a06da")


package() {
  # Install License
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # Install Binary
  install -Dm755 ${_pkgsrc}-${pkgver}-${pkgrel} ${pkgdir}/usr/bin/$_pkgbin
}

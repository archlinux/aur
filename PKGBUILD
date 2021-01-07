# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=eos_portable_archive
pkgver=5.1
pkgrel=4
pkgdesc="A portable binary archive to be used with boost::serialization"
arch=('any')
url="https://epa.codeplex.com/"
license=('custom')
depends=('boost')
source=("https://codeplexarchive.blob.core.windows.net/archive/projects/epa/epa.zip")
sha256sums=('8db1d984bb6be6571cea2caf52f8dfcd421b607f3d35384544376d5645dcd482')

prepare() {
  bsdtar xf sourceCode/sourceCode.zip
}

package() {
  install -d -m755 "$pkgdir/usr/include/eos"
  install -m644 eos/* "$pkgdir/usr/include/eos/"

  # copy boost license from filesystem
  install -D -m644 /usr/share/licenses/boost/* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

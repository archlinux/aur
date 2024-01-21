# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Corax <cor dot ax26 at gmail dot com>
pkgname=python-mediainfodll
pkgver=17.10
pkgrel=1
epoch=1
pkgdesc="Python shared library for reading metadata from media files"
arch=('any')
url="https://github.com/MediaArea/MediaInfoLib"
license=('BSD 2-Clause')
depends=('libmediainfo' 'python')
source=("MediaInfoLib-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2e5622b685f4bca23726e6646da542861edb01c26a73502a14d1b553f9a18dfb')

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "MediaInfoLib-$pkgver"
  install -Dm644 Source/MediaInfoDLL/MediaInfoDLL3.py -t "$pkgdir/$site_packages"
  install -Dm644 License.html -t "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: Corax <cor dot ax26 at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-mediainfodll
pkgver=25.10
pkgrel=1
epoch=1
pkgdesc="Python shared library for reading metadata from media files"
arch=('any')
url="https://github.com/MediaArea/MediaInfoLib"
license=('BSD 2-Clause')
depends=('libmediainfo' 'python')
source=("MediaInfoLib-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e4b2b82f3df8d2c190643d1705ee35c3102674954858d02a2e2b42840f0f07aa')

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "MediaInfoLib-$pkgver"
  install -Dm644 Source/MediaInfoDLL/MediaInfoDLL3.py -t "$pkgdir/$site_packages"
  install -Dm644 License.html -t "$pkgdir/usr/share/licenses/$pkgname"
}

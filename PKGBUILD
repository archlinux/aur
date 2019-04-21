# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=flauncher
pkgver='1.0.0'
pkgrel='1'
pkgdesc='universal file launcher for terminal'
arch=('any')
url='https://github.com/yoarch/flauncher'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/f/flauncher/flauncher-1.0.0.tar.gz")
sha256sums=('8181afd3704acfd3266504fc9ef162acf5281c2f4bd68cd08eef108835586793')
#source#=("file:///$MHOME/dev/python/flauncher/dist/flauncher-1.0.0.tar.gz")
#sha256sums#=("SKIP")

build() {
  cd $srcdir/flauncher-${pkgver}
  python setup.py build
}

package() {
  cd $srcdir/flauncher-${pkgver}

  python setup.py install --root="$pkgdir/"  --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/lib/$pkgname/README.md"
  install -Dm644 conf/default_launchers.json "$pkgdir/usr/lib/$pkgname/default_launchers.json"
  install -Dm644 conf/audio_exts.json "$pkgdir/usr/lib/$pkgname/audio_exts.json"
  install -Dm644 conf/image_exts.json "$pkgdir/usr/lib/$pkgname/image_exts.json"
  install -Dm644 conf/video_exts.json "$pkgdir/usr/lib/$pkgname/video_exts.json"
}

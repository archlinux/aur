# Maintainer: Nick77 <qwiko20@tutamail.com>

pkgname=jarvis-llm
pkgver=0.1
pkgrel=1
pkgdesc='jsrvis, a  cli llm client'
arch=('any')
url='https://github.com/Catalina-sys456/jarvis-llm'
license=('MIT')
depends=('python')
makedepends=(python-build
	     python-installer
	     python-wheel
	     python-hatchling)
source=(        
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('1d45983cddbdb01fb5e3c6f23e518aadb7525faf0340d098f4b693effae5010c77f468de7fb0ce98518817d184cb0dacc8c50614b70d99381feb2ce37566cb3d')

build(){
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
    install -Dm644 config.yaml ~/config/jarvis/config.yaml
}


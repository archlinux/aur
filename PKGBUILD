# Maintainer: Nick77 <qwiko20@tutamail.com>

pkgname=jarvis
pkgver=0.1
pkgrel=1
pkgdesc='jsrvis,  a cli llm client'
arch=('any')
url='https://github.com/Catalina-sys456/jarvis'
license=('MIT')
depends=('python')
makedepends=(python-build
	     python-installer
	     python-wheel
	     python-hatchling)
source=(        
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sum=('0d7e9f17315283ca9b4882da62c09b6ad9498d57c565b6f94c0fa3a427d637b7')

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


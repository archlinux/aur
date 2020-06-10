# Maintainer: Pradana Aumars paumars@protonmail.com

pkgname=imgur-downloader
_appname=imgur_downloader
pkgver=0.2.2
pkgrel=1
pkgdesc="Python script/class to download an entire Imgur album in one go into a folder of your choice. "
license=('MIT')
url="https://pypi.org/project/$pkgname/"
arch=('any')
groups=()
depends=('python>=3.3')
makedepends=("python-setuptools")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://files.pythonhosted.org/packages/source/${_appname::1}/$_appname/$_appname-$pkgver.tar.gz")
sha1sums=('d7ea57eea65bbce02eaf1f9348d081b1145c7eb5')

build() {
  cd $srcdir/$_appname-$pkgver
  python setup.py bdist
}


package() {
    _pkg=$(ls "$srcdir/$_appname-$pkgver/dist/")
    tar -xC "$pkgdir/" -f "$srcdir/$_appname-$pkgver/dist/$_pkg"

    mkdir -p "$pkgdir/usr/bin"
}

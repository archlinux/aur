# Maintainer: Kenny MacDermid <kenny.macdermid@gmail.com>
pkgname=sshoot
_name=sshoot
pkgver=1.5.1
pkgrel=1
pkgdesc="Manage multiple sshuttle VPN sessions."
arch=('any')
url="https://github.com/albertodonato/sshoot"
license=('GPL3')
depends=('python' 'python-pyaml' 'python-prettytable' 'python-argcomplete'
 'python-xdg' 'python-toolrack')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cd9b34014f734c5c92c87e80110a93407a73066dc6f9e43d30c66fa29e252516')
sha512sums=('b13cc027f7a3a175737a0cb316b6306ba4b73d98df334fce3eda7bdca79ccc67bb13c4bdbd8b2cd342c6a7a20c555a67f112995d67fb8ffa63a39016f6dd210c')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=python-opencv-python
_name="${pkgname#python-}"

_py=cp38
_rel=36
pkgver=4.3.0.$_rel
pkgrel=1

pkgdesc='Wrapper package for OpenCV Python bindings'
arch=('x86_64')
url="https://github.com/skvark/$_name"
license=('MIT' 'BSD' 'LGPL')

makedepends=('python-pip')
depends=('python-numpy>=1.17.3')

source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-${_py}-manylinux2014_x86_64.whl")
sha256sums=('210ab40c8c9dadc7dc9ed7beebe2e0a2415a744f8d6857762a80c8e0fcc477c8')

options=('!strip')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  install -Dm644 cv2/LICENSE{,-3RD-PARTY}.txt -t"$pkgdir/usr/share/licenses/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:

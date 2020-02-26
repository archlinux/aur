# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=python-opencv-python
_name="${pkgname#python-}"

_py=cp38
_rel=32
pkgver=4.2.0.$_rel
pkgrel=1

pkgdesc='Wrapper package for OpenCV Python bindings'
arch=('x86_64')
url="https://github.com/skvark/$_name"
license=('MIT' 'BSD' 'LGPL')

makedepends=('python-pip')
depends=('python-numpy>=1.17.3')

source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-${_py}-manylinux1_x86_64.whl")
sha256sums=('1b90d50bc7a31e9573a8da1b80fcd1e4d9c86c0e5f76387858e1b87eb8b0332b')

options=('!strip')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  install -Dm644 cv2/LICENSE{,-3RD-PARTY}.txt -t"$pkgdir/usr/share/licenses/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:

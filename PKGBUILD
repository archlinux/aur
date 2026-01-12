# Maintainer: Arzet Ro <arzeth0@gmail.com>

pkgname=python-wetextprocessing
pkgver=1.0.4.1
pkgrel=1
pkgdesc="Text Normalization & Inverse Text Normalization"
arch=('any')
url="https://github.com/wenet-e2e/WeTextProcessing"
license=('Apache-2.0')
depends=('python' 'python-flake8' 'python-importlib_resources' 'python-pynini')
makedepends=('python-setuptools' 'cython') # python-pbr?
source=(https://files.pythonhosted.org/packages/source/w/WeTextProcessing/WeTextProcessing-$pkgver.tar.gz)
sha512sums=('bdafa84c058beb695232abcec37a6425f9604912355bbda5fe2f591ac34ab730816efe617c2fb45d0e8a93f22340af70c02037d3a9cbe2a517d4c8bb44d9aef7')

# It can also be used in CLI:
# Chinese Text Normalization
# wetn --text '苹果宣布发布新ＩＰＨＯＮＥ'
# Inverse Text Normalization:
# weitn --text '二点五平方电线'

# They also have cpp runtime
# but is it worth adding it here (i.e. make this a double package)?

build() {
  cd "$srcdir"/WeTextProcessing-$pkgver

  # If using .tar.gz from GitHub instead of pythonhosted.org,
  # then uncomment this line:
  #   pre-commit install
  # And also add `pre-commit` to `makedepends=(...)`

  python setup.py build --version="1.0.4.1"
  # or without `-1` shound
}

package() {
  cd "$srcdir"/WeTextProcessing-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build --version="1.0.4.1"
}

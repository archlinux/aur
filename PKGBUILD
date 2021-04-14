# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-rtoml
pkgver=0.6.1
pkgrel=1
pkgdesc="A better TOML library for python implemented in rust."
arch=('x86_64')
url="https://pypi.org/project/rtoml"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-setuptools-rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/samuelcolvin/rtoml/archive/v${pkgver}.tar.gz")
sha256sums=('9370a210c88c7e985b4cc40b3ae2fb0837ea643447df2544b4bac7eecf614147')
b2sums=('e9bf70e108d8d450d048dd049df956ba0668da6eda782b5a6a4e324a375a8ebe7ff6efb249b9a17c3c39bf7dce75a2181694b9031d68146be9d2a68713f9e6d5')

check() {
  cd "rtoml-${pkgver}"

  export PYTHONPATH="build/lib"
  python setup.py test
}

package() {
  cd "rtoml-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

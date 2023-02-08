# Maintainer: Andrea Orru <andrea at orru dot io>

pkgbase='tod0'
pkgname=('tod0')
_module='tod0'
pkgver='0.7.1'
pkgrel=1
pkgdesc="A Terminal Client for Microsoft To-Do."
url="https://github.com/kiblee/tod0"
depends=('python' 'python-prompt_toolkit' 'python-requests-oauthlib' 'python-yaml' 'python-beautifulsoup4' 'python-yaspin' 'python-setuptools')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('465de30c87313df52b3f7cce681f5b255a6f46f59be52a519407de9896b59120')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# Maintainer: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=jupyter_stata_kernel
_pyname=stata_kernel
pkgname=('jupyter_stata_kernel')
depends=('python' 'jupyter' 'python-pandas' 'python-beautifulsoup4'
         'python-packaging' 'python-pillow' 'python-pexpect'
         'python-pygments' 'python-requests')
makedepends=('python-setuptools')
pkgver=1.11.2
pkgrel=1
pkgdesc="A Jupyter kernel for Stata. Works with Windows, macOS, and Linux. Preserves program state."
arch=('any')
url="https://kylebarron.github.io/stata_kernel/"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/cc/c7/05e2d4b43dda39fa18bcf9349fffa86746405bcdb6771b2f87278a9475b6/stata_kernel-1.11.2.tar.gz")
sha256sums=('31b518165a4b4f7e9d9b130affaeb1b1b2ddd1a36ea3b141fcf478d75de60c3f')
install=jupyter_stata_kernel.install

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}


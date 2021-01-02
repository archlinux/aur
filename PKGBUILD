# Maintainer: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=jupyter_stata_kernel
_pyname=stata_kernel
pkgname=('jupyter_stata_kernel')
depends=('python' 'jupyter' 'python-pandas' 'python-beautifulsoup4'
         'python-packaging' 'python-pillow' 'python-pexpect'
         'python-pygments' 'python-requests')
makedepends=('python-setuptools')
pkgver=1.12.2
pkgrel=1
pkgdesc="A Jupyter kernel for Stata. Works with Windows, macOS, and Linux. Preserves program state."
arch=('any')
url="https://kylebarron.github.io/stata_kernel/"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/b9/b1/2dffa47989d0777fe49c655dd9ea5d62acbfb887f84eff779974b11020b9/stata_kernel-1.12.2.tar.gz")
sha256sums=('23cd0d89e691a138906ea68a12663cb1301b82d1af8db6883c5495708d2e58fa')
install=jupyter_stata_kernel.install

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}


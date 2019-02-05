# Maintainer: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=jupyter_stata_kernel
_pyname=stata_kernel
pkgname=('jupyter_stata_kernel')
depends=('python' 'jupyter' 'python-pandas' 'python-beautifulsoup4'
         'python-packaging' 'python-pillow' 'python-pexpect'
         'python-pygments' 'python-requests')
makedepends=('python-setuptools')
pkgver=1.10.5
pkgrel=1
pkgdesc="A Jupyter kernel for Stata. Works with Windows, macOS, and Linux. Preserves program state."
arch=('any')
url="https://kylebarron.github.io/stata_kernel/"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/67/86/5979c2b683851f9e6a0a672ceaee3171fe7e18e152554deb0d62101c9879/stata_kernel-1.10.5.tar.gz")
sha256sums=('a57d8520c4aa9c5dfc625033bdfe3530a155a60e2e54c7c39065cb971c1b7c98')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

post_install() {
  python -m stata_kernel.install
}

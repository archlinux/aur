# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=hrv-analysis
pkgname=python-${_name,,}
pkgver=1.0.4
pkgrel=1
pkgdesc='a package to calculate features from Rr Interval for HRV analyses'
arch=('any')
url="https://github.com/Aura-healthcare/hrv-analysis"
license=('GPL3')
depends=('python>=3.5'
	 'python-astropy>=3.0.4'
	 'python-future>=0.16.0'
	 'python-nolds>=0.4.1'
	 'python-numpy>=1.15.1'
	 'python-scipy>=1.1.0'
	 'python-nolds>=0.4.1'
	 )
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('a38f5347addba44415d23a82381ea38f127e9f7ce62d2a7f665e8c66343b6380')

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    rm -rf "$pkgdir"/usr/lib/python${_python_version}/site-packages/{tests,docs,build_tools,examples,extension_templates}
}

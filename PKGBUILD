# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
pkgname=python-sregistry
_pkgname=sregistry
pkgver=0.0.89
pkgrel=1
pkgdesc="Singularity Container's registry command-line tool (sregistry) to interact with a Singularity Registry"
arch=('any')
url="https://singularityhub.github.io/sregistry-cli/"
license=('AGPL3')
depends=('python-spython' 'python-requests' 'python-pygments'
         'python-chardet' 'python-idna' 'python-urllib3' 'python-certifi')
provides=('singularity-registry-cli')
optdepends=('singularity-container: to use and manipulate Singularity Containers')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c836ed5fe68de318593c0ef5da6847f7033c2778d352aac9ee11eb9d6cb4b2f6')

build() {
	cd "${_pkgname}-${pkgver}"
    /usr/bin/python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
    /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

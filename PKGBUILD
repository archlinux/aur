# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-git-revision-date-localized-plugin"
pkgver=0.12.1
pkgrel=1
pkgdesc="MkDocs plugin to add a last updated date to your site pages"
url="https://github.com/timvink/mkdocs-git-revision-date-localized-plugin/"
license=('MIT')
arch=("any")
conflicts=("python-mkdocs-git-revision-date-localized-plugin")
replaces=("python-mkdocs-git-revision-date-localized-plugin")
depends=("mkdocs" "python-gitpython" "python-babel>=2.7.0")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e1093fd84d322f69ea843f4f09219c543d83ce6823ea22eece18e7c8b1de9a50')

build(){
    cd ${srcdir}/${pkgname}-${pkgver}

    python setup.py build
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

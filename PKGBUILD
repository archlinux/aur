# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=django-widget-tweaks
pkgbase=python-django-widget-tweaks
pkgname=('python-django-widget-tweaks')
pkgver=1.5.0
pkgrel=2
pkgdesc="Tweak the form field rendering in templates, not in python-level form definitions. CSS classes and HTML attributes can be altered."
arch=('any')
url="https://github.com/jazzband/django-widget-tweaks/"
license=('MIT')
makedepends=('python-setuptools' 'python-django')
source=("https://files.pythonhosted.org/packages/a5/fe/26eb92fba83844e71bbec0ced7fc2e843e5990020e3cc676925204031654/${_pipname}-${pkgver}.tar.gz")
sha256sums=('1c2180681ebb994e922c754804c7ffebbe1245014777ac47897a81f57cc629c7')


build() {
    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py build
}

package() {
    depends=('python-django')

    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

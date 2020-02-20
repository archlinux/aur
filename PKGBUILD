# Maintainer: luxcem <a@luxcem.fr>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Apkawa <apkawa at gmail dot com>
pkgname=django-docs
pkgver=3.0
pkgrel=1
pkgdesc="Docs for Django's release"
arch=('any')
url='https://docs.djangoproject.com/en/'
license=('GPL')
makedepends=('unzip')
source=("https://media.djangoproject.com/docs/django-docs-${pkgver}-en.zip")
noextract=("django-docs-${pkgver}-en.zip")
# We check sha256 but we will see if it does change even if pkgver doesnt
sha256sums=('af0eb41a4756f3108fb39cbf15812044bda535e87c1395806312864f3c4d113e')

prepare() {
  unzip -oq "django-docs-${pkgver}-en.zip" -d "$srcdir/html"
}

package() {
  install -d "${pkgdir}/usr/share/doc/django/"
  cp -r "$srcdir/html" "${pkgdir}/usr/share/doc/django/"
}

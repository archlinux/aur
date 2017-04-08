# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Apkawa <apkawa at gmail dot com>
pkgname=django-docs
pkgver=1.11
pkgrel=1
pkgdesc="Docs for Django's release"
arch=('any')
url='https://docs.djangoproject.com/en/'
license=('GPL')
makedepends=('unzip')
source=("https://docs.djangoproject.com/m/docs/django-docs-${pkgver}-en.zip")
noextract=("django-docs-${pkgver}-en.zip")
# They make minor changes to the ZIP archive contents every now and then,
# so we have to skip hash sum check.
sha256sums=('e4f1bba4c829af55af7d0f116243acacd7b824865aaf686a043cf39f34d2746e')

prepare() {
  unzip "django-docs-${pkgver}-en.zip" -d "$srcdir/html"
}

package() {
  install -d "${pkgdir}/usr/share/doc/django/"
  cp -r "$srcdir/html" "${pkgdir}/usr/share/doc/django/"
}


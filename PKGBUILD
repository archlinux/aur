# Maintainer: luxcem <a@luxcem.fr>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Apkawa <apkawa at gmail dot com>
pkgname=django-docs
pkgver=3.2
pkgrel=1
pkgdesc="Docs for Django's release"
arch=('any')
url='https://docs.djangoproject.com/en/'
license=('GPL')
makedepends=('unzip')
source=("https://media.djangoproject.com/docs/django-docs-${pkgver}-en.zip")
noextract=("django-docs-${pkgver}-en.zip")
# We check sha256 but we will see if it does change even if pkgver doesnt
sha256sums=('64fb3531c13e96419681e93884187ac25f2989564deee1872c9b2303d02487eb')

prepare() {
  unzip -oq "django-docs-${pkgver}-en.zip" -d "$srcdir/html"
}

package() {
  install -d "${pkgdir}/usr/share/doc/django/"
  cp -r "$srcdir/html" "${pkgdir}/usr/share/doc/django/"
}

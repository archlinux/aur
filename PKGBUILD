# Maintainer: Anuj More <anujmorex@gmail.com>
# Contributor 2: Dominik Mayer <dominik.mayer@gmail.com>
# Contributor 1: Lee.MaRS <leemars@gmail.com>

pkgname=google-appengine-java
pkgver=1.8.4
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Google App Engine SDK for Java."
url="http://code.google.com/appengine/"
license="('Apache 2')"
depends=()
options=('!strip')
source=(http://googleappengine.googlecode.com/files/appengine-java-sdk-${pkgver}.zip
        profile.appengine-java-sdk)
sha1sums=('ca7077793a1c7c4d078110416635c095eecde3f9'
          '9d6e6c6bd7f3ec53dc08cdfacaac931cfa1cf2f3')

package() {
  cd "$srcdir"
  mkdir "$pkgdir/opt/"
  cp -R appengine-java-sdk-${pkgver}/ "$pkgdir/opt/$pkgname"

  install -D -m755 profile.appengine-java-sdk "$pkgdir/etc/profile.d/appengine-java-sdk.sh"
}


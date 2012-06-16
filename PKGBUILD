# Maintainer: Anuj More <anujmorex@gmail.com>
# Contributor 3: Romain Schmitz <slopjong [at] syn2cat.lu>
# Contributor 2: Dominik Mayer <dominik.mayer@gmail.com>
# Contributor 1: Lee.MaRS <leemars@gmail.com>

pkgname=google-appengine-java
pkgver=1.6.6
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Google App Engine SDK for Java."
url="http://code.google.com/appengine/"
license="('Apache 2')"
depends=()
options=('!strip')
source=(http://googleappengine.googlecode.com/files/appengine-java-sdk-${pkgver}.zip
        profile.appengine-java-sdk)
sha1sums=('bb67c8984606fc8d28ab4f49afc088b5b70d9097'
          '9d6e6c6bd7f3ec53dc08cdfacaac931cfa1cf2f3')

build() {
  cd "$startdir/src"
  mkdir "$startdir/pkg/opt/"
  cp -R appengine-java-sdk-${pkgver}/ "$startdir/pkg/opt/$pkgname"

  install -D -m755 profile.appengine-java-sdk "$startdir/pkg/etc/profile.d/appengine-java-sdk.sh"
}
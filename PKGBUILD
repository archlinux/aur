# Maintainer: Anuj More <anujmorex@gmail.com>
# Contributor 3: Romain Schmitz <slopjong [at] syn2cat.lu>
# Contributor 2: Dominik Mayer <dominik.mayer@gmail.com>
# Contributor 1: Lee.MaRS <leemars@gmail.com>

pkgname=google-appengine-java
pkgver=1.7.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Google App Engine SDK for Java."
url="https://developers.google.com/appengine/"
license="('Apache 2')"
depends=()
options=('!strip')
source=(http://googleappengine.googlecode.com/files/appengine-java-sdk-${pkgver}.zip
        profile.appengine-java-sdk)
sha1sums=('08d1a2978a71d5fab3e22d7bba142f49224ac6b1'
          '9d6e6c6bd7f3ec53dc08cdfacaac931cfa1cf2f3')

build() {
  cd "$startdir/src"
  mkdir "$startdir/pkg/opt/"
  cp -R appengine-java-sdk-${pkgver}/ "$startdir/pkg/opt/$pkgname"

  install -D -m755 profile.appengine-java-sdk "$startdir/pkg/etc/profile.d/appengine-java-sdk.sh"
}
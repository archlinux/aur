# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=eclipse-androidproguardscala
pkgver=0.0.51
pkgrel=1
pkgdesc="An Eclipse builder for Android projects using Scala"
arch=('any')
url="https://github.com/banshee/AndroidProguardScala"
license=('GPL')
depends=('eclipse-scala-ide' 'eclipse-android')
source=("https://androidproguardscala.s3.amazonaws.com/UpdateSiteForAndroidProguardScala/plugins/com.restphone.androidproguardscala_${pkgver}.jar"
        "https://androidproguardscala.s3.amazonaws.com/UpdateSiteForAndroidProguardScala/features/com.restphone.androidproguardscala.feature_${pkgver}.jar")
md5sums=('a33377de365c9d0b7fae2689b840c709'
         'cf7a9de1c86b9277dc9939afc3f02c40')
noextract=("com.restphone.androidproguardscala_${pkgver}.jar" "com.restphone.androidproguardscala.feature_${pkgver}.jar")

build() {
  true
}

package() {
  cd "${srcdir}"
  _dest="${pkgdir}"/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
  mkdir -p "${_dest}/com.restphone.androidproguardscala.feature_${pkgver}"
  unzip "com.restphone.androidproguardscala.feature_${pkgver}.jar" -d "${_dest}/com.restphone.androidproguardscala.feature_${pkgver}"
  install -Dm644 "com.restphone.androidproguardscala_${pkgver}.jar" "${_dest}/com.restphone.androidproguardscala_${pkgver}.jar"
}


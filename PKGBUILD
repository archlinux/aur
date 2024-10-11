# Maintainer: ferreum <code at ferreum dot de>

pkgname=jdk-android-studio
pkgver=3
pkgrel=1
pkgdesc="Integrate android-studio provided JDK with archlinux-java"
# android-studio package depends on external java-environment on i686
arch=(x86_64)
url="https://developer.android.com/studio"
license=(APACHE)
depends=('android-studio>=2023.1.1.1' java-environment-common)
provides=(java-runtime=17 java-runtime-openjdk=17
          java-environment=17 java-environment-openjdk=17)
install=jdk-android-studio.install

package() {
  local base_pkgname=android-studio
  install -d "${pkgdir}/usr/lib/jvm/$base_pkgname"
  ln -s "/opt/${base_pkgname}/jbr/"{bin,conf,legal,lib,release} \
    "${pkgdir}/usr/lib/jvm/$base_pkgname/"
}

# vim:set ts=2 sw=2 et:

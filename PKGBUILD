# Maintainer: Jason Stryker <public at jasonstryker dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Marcel Huber <marcelhuberfoo at gmail dott com>
# Contributor: Illarion Kovalchuk <illarion.kovalchuk at gmail dot com>

pkgname=jenkins-experimental
pkgver=2.155
pkgrel=1
pkgdesc='Extendable continuous integration server (experimental build for latest java version)'
arch=('any')
url='https://jenkins.io'
license=('MIT')
depends=('java-runtime>=11' 'ttf-dejavu' 'libcups')
provides=('jenkins-ci')
conflicts=('jenkins-ci')
replaces=('jenkins-ci')
backup=('etc/conf.d/jenkins')
install='jenkins.install'
noextract=("jenkins-${pkgver}.war")
source=("jenkins-${pkgver}.war::http://mirrors.jenkins-ci.org/war/${pkgver}/jenkins.war"
        "jaxb-api.jar::http://central.maven.org/maven2/javax/xml/bind/jaxb-api/2.3.0/jaxb-api-2.3.0.jar"
        "jaxb-core.jar::http://central.maven.org/maven2/com/sun/xml/bind/jaxb-core/2.3.0.1/jaxb-core-2.3.0.1.jar"
        "jaxb-impl.jar::http://central.maven.org/maven2/com/sun/xml/bind/jaxb-impl/2.3.0.1/jaxb-impl-2.3.0.1.jar"
        "javax.activation.jar::https://github.com/javaee/activation/releases/download/JAF-1_2_0/javax.activation.jar"
        'jenkins.conf'
        'jenkins.service'
        'jenkins.tmpfiles'
        'jenkins.sysusers'
        'LICENSE')
sha512sums=('b7ce35de687094161d55d50522ccf8f80d8369e383ba97bd2de2082b5b03eea5385ae5d8aa46d80112c4f3df30584c9ba7ab2e58542c9c9c0ce7c2b2e17b481e'
            '0c5bfc2c9f655bf5e6d596e0c196dcb9344d6dc78bf774207c8f8b6be59f69addf2b3121e81491983eff648dfbd55002b9878132de190825dad3ef3a1265b367'
            'fda51767b175ab5b12c7438b9a11873fe570fa4b5ffa2c3d10eebca9d1dcada6a8ff2d287ac76017c6a546e1f5cb02988fb7e2fac32a4a95ad443e1a1b4ade35'
            'f6152fd8ceb1197c0296bdde443b67fd4e0f0ebd47beda1d8eee9fba396468b3c4a515ebde53ee3262164e6bb75bfd59f470ef3a7ea71b30cb7f9bfd9df8743b'
            'b4cbdd8fd1703e4b2e1e691db78fbcf2232d836f740d1821c4c191a14f9472508e27a40d06e4b6b153964af68032959c22945ba169a0ca4018b7748162f420a6'
            'f77a4c9d8d2cd4b1e43a19e9b899103f231cff0e01d9c5a2e2895a0c133b57819db9af00ae441ce7e6e5187063fd18259653a97e7680adf9cc55bedd5ed1e2e1'
            'a336b006d3711abb75b49a2e12c09ee61cf3275a2cdbbd3676480e2f6ca8ba0fb4b9c08f3f9da193252c4fca827e9a1d5eaad847d0a889445693427ae1571fe7'
            'a845a7147be54affc586dfce9a188ec24c92e673e88dec0b62da386d2e597de6ecda103429008562abd897f179a52c37cf2188ebc65b8c636efd07d707e18f90'
            '896cbc64eadb2f3bb9fa7fc26dbfc527b1823d8bff3158be7f1936cc250f55eeafe89079e1ceb8f3d269041662573ccbbb36248140b4ba24144a564366f8847a'
            '0df6479a600db395c12ad29ebda3120d00460338b9a6b15913e2245aa29212a3798c32e664ca70c8034146e2e0b573066deec9e3210198202f753994e1b83efa')

package() {
  install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm444 "jenkins-${pkgver}.war" "$pkgdir/usr/share/java/jenkins/jenkins.war"
  install -Dm444 "jaxb-api.jar" "$pkgdir/usr/share/java/jenkins/jaxb-api.jar"
  install -Dm444 "jaxb-core.jar" "$pkgdir/usr/share/java/jenkins/jaxb-core.jar"
  install -Dm444 "jaxb-impl.jar" "$pkgdir/usr/share/java/jenkins/jaxb-impl.jar"
  install -Dm444 "javax.activation.jar" "$pkgdir/usr/share/java/jenkins/javax.activation.jar"
  install -Dm644 jenkins.service \
    "$pkgdir/usr/lib/systemd/system/jenkins.service"
  install -Dm644 jenkins.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/jenkins.conf"
  install -Dm644 jenkins.sysusers "$pkgdir/usr/lib/sysusers.d/jenkins.conf"
  install -Dm644 jenkins.conf "$pkgdir/etc/conf.d/jenkins"
}

# vim:set ts=2 sw=2 et:

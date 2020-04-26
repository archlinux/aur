# Maintainer: Philipp Tusch <zokker13@posteo.de>
# Contributor: Tom Wizetek <tom@wizetek.com>
# Contributor: koentje
# Contributor: Ian Taylor <ian at lorf dot orgs>
# Contributor: Philipp Tusch <zokker13@posteo.de>
# Contributor: Matt Pallissard <matthew.paul@pallissard.net>

pkgname=apachedirectorystudio
_pkgname=ApacheDirectoryStudio
pkgver=2.0.0.v20200411.15
pkgrel=0
_pkgver="${pkgver%.*}-M${pkgver##*.}"
pkgdesc="Eclipse based LDAP browser and directory client"
arch=('x86_64')
url="https://directory.apache.org/studio/"
license=('Apache')
depends=('java-runtime>=8' 'java-runtime<=14' 'python' 'libsecret')
source=('apachedirectorystudio.desktop' 'apachedirectorystudio.png')
source_x86_64=("http://www.apache.org/dist/directory/studio/$_pkgver/$_pkgname-$_pkgver-linux.gtk.${CARCH}.tar.gz")
sha256sums=('d8c2b2b4bc29de8d5dca34b6f9f1ff1a8716f91cf132d76232a9a133a95c6e68'
            '400929c64547773a1bba1c82f7c12f9cd55f2a68b43f5fcebc3c4d07cbe6549b')
sha256sums_x86_64=('67b0c5627abcc4bd6ab2be977d8ed50327b394e2b55cceb0983051cd30587ee6')

package() {
  cd "$pkgdir"

  install -dm0755 opt/$_pkgname usr/bin usr/share/applications/
  cp -a "$srcdir"/$_pkgname/* opt/$_pkgname/

  ln -sf /opt/$_pkgname/$_pkgname usr/bin/$_pkgname
  ln -sf /opt/$_pkgname/$_pkgname usr/bin/$pkgname

  install -Dm644 "$srcdir"/apachedirectorystudio.desktop "$pkgdir"/usr/share/applications/apachedirectorystudio.desktop
  install -Dm644 "$srcdir"/apachedirectorystudio.png "$pkgdir"/usr/share/pixmaps/apachedirectorystudio.png
}

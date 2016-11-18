# Maintainer: Matt Pallissard <matthew.paul@pallissard.net>
# Contributor: Tom Wizetek <tom@wizetek.com>
# Contributor: koentje
# Contributor: Ian Taylor <ian at lorf dot orgs>

pkgname=apachedirectorystudio
_pkgname=ApacheDirectoryStudio
pkgver=2.0.0.v20161101.12
pkgrel=1
_pkgver="${pkgver%.*}-M${pkgver##*.}"
pkgdesc="Eclipse based LDAP browser and directory client"
arch=('i686' 'x86_64')
url="http://directory.apache.org/studio/"
license=('Apache')
depends=('java-runtime' 'gtk2')
source_i686=("http://www.us.apache.org/dist/directory/studio/$_pkgver/$_pkgname-$_pkgver-linux.gtk.x86.tar.gz")
source_x86_64=("http://www.us.apache.org/dist/directory/studio/$_pkgver/$_pkgname-$_pkgver-linux.gtk.x86_64.tar.gz")
sha256sums_i686=('3530d9cb61d046555a69cb2305c389265f89e7a451a19d7efabb5e883af27006')
sha256sums_x86_64=('aac2790d9cdb0e134cba544e0e387dfd6673023bf1cbaec9a0ed3b58f4105861')

package() {
  cd "$pkgdir"

  install -dm0755 opt/$_pkgname usr/bin usr/share/applications/
  cp -a "$srcdir"/$_pkgname/* opt/$_pkgname/

  ln -sf /opt/$_pkgname/$_pkgname usr/bin/$_pkgname
  ln -sf /opt/$_pkgname/$_pkgname usr/bin/$pkgname

  cat > usr/share/applications/$_pkgname.desktop <<EOF
[Desktop Entry]
Version=$_pkgver
Encoding=UTF-8
Name=Apache Directory Studio
Comment=$pkgdesc
Exec=/opt/$_pkgname/$_pkgname
Icon=/opt/ApacheDirectoryStudio/features/org.apache.directory.studio.ldapbrowser.feature_$_pkgver/studio.png
Terminal=false
Type=Application
Categories=Java;Network;
EOF
}

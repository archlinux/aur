# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=cxstudy-wine
pkgver=1.4.0
pkgrel=1
# https://atomgit.com/JingluWei_chn/cxstudy-wine/tree/master
pkgdesc="a version of repacked wine app of cxstudy(学习通)"
arch=('x86_64')
url=""https://atomgit.com/JingluWei_chn/cxstudy-wine/tree/master
license=('MIT')
depends=('wine' 'wine-mono' 'wine-gecko' 'noto-fonts' 'tar' 'git')
source=(
  'cxstudy-wine-master-1.4.0.zip::git+https://gitcode.com/JingluWei_chn/cxstudy-wine.git')
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  #$pkgdir/usr/bin/lib/cxstudy-wine
  mkdir -p "$pkgdir/usr/bin/lib/cxstudy-wine/cxstudy"
  cp -r "$srcdir/cxstudy-wine-master-1.4.0.zip" "$pkgdir/usr/bin/lib/cxstudy-wine/cxstudy" 
  cd "$pkgdir/usr/bin/lib/cxstudy-wine/cxstudy/cxstudy-wine-master-1.4.0.zip/1.4.0/1.4.0"
  tar -zxvf "$pkgdir/usr/bin/lib/cxstudy-wine/cxstudy/cxstudy-wine-master-1.4.0.zip/1.4.0/1.4.0/cxstudy.tar.gz"
  rm "$pkgdir/usr/bin/lib/cxstudy-wine/cxstudy/cxstudy-wine-master-1.4.0.zip/1.4.0/1.4.0/cxstudy.tar.gz"
  cd "$pkgdir/usr/bin/lib/cxstudy-wine/cxstudy/cxstudy-wine-master-1.4.0.zip/1.4.0/1.4.0/resources"
  tar -zxvf "$pkgdir/usr/bin/lib/cxstudy-wine/cxstudy/cxstudy-wine-master-1.4.0.zip/1.4.0/1.4.0/resources/app.tar.gz"
  rm "$pkgdir/usr/bin/lib/cxstudy-wine/cxstudy/cxstudy-wine-master-1.4.0.zip/1.4.0/1.4.0/resources/app.tar.gz"
  sudo mv /usr/bin/lib/cxstudy-wine/cxstudy/cxstudy-wine-master-1.4.0.zip/1.4.0/cxstudy-wine.desktop /usr/share/applications/cxstudy-wine.desktop
  sudo chmod +x /usr/share/applications/cxstudy-wine.desktop
}
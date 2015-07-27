# Maintainer: Vitali Carbivnicii <realcnbs@gmail.com>

pkgname=activecollab-timer
pkgver=3.1.2
pkgrel=1
pkgdesc="activeCollab Timer tracks time on your desktop computer and lets you easily submit it to activeCollab via activeCollab API. "
arch=('i686' 'x86_64')
url="https://www.activecollab.com/timer.html"
license=('unknown')
groups=()
depends=(libxss)
makedepends=(unzip)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
if [ "$CARCH" == 'x86_64' ]
then
  source=($pkgname-$pkgver.zip::https://www.activecollab.com/downloads/category/9/package/315/release/4janj8etktpspq2tprxhzloyl/download)
  md5sums=(7a426bc8afb62f168893c619ea12aefa)
else
  source=($pkgname-$pkgver.zip::https://www.activecollab.com/downloads/category/9/package/314/release/5qyoyqigiw3tmmp0xmec5uk9e/download)
  md5sums=(86aafc496c9fbf904723f4d652f0d23b)
fi

package() {
    cd $srcdir/
    unzip $pkgname-$pkgver.zip

    cd activeCollabTimer3-64
    mkdir -p $pkgdir/opt/activecollab-timer || return 1
    cp -rf * $pkgdir/opt/activecollab-timer

    mkdir -p ${pkgdir}/usr/bin/ || return 1
    chmod +x $pkgdir/opt/activecollab-timer/activeCollabTimer3
    chmod +x $pkgdir/opt/activecollab-timer/activeCollabTimer3.sh

    ln -s $pkgdir/opt/activecollab-timer/activeCollabTimer3 "$pkgdir/usr/bin/activeCollabTimer3"
}
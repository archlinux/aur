# Maintainer:  <yatsen71@oarchbox1>
pkgname=winmacs-wallpapers
pkgver=2020.12
pkgrel=1
epoch=
pkgdesc="Windows and MacOS wallpapers"
arch=('i686' 'x86_64')
url="https://aur.archlinux.org/winmacs-wallpapers.git"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
#source=($pkgname-$pkgver.tar.gz
#        $pkgname-$pkgver.patch)
source=("https://512pixels.net/downloads/macos-wallpapers-thumbs/10-5--thumb.png"
        "https://512pixels.net/downloads/macos-wallpapers-thumbs/10-7--thumb.png"
        "https://512pixels.net/downloads/macos-wallpapers-thumbs/10-8--thumb.jpg"
        "https://512pixels.net/downloads/macos-wallpapers-thumbs/10-13--thumb.jpg"
        "https://512pixels.net/downloads/macos-wallpapers-thumbs/10-14-Day-Thumb.jpg")
md5sums=('7359aece69929fb5084ad00167af5158'
         'd0bd3bf930e9cf11f9514b3f34c98d24'
         '85ae6d6994f2b5b258339c1e819a1257'
         '9b830c7281a8e7bfa10fa220f0f66061'
         'bc02a5b7f01c34a3af09de70970208b2')
noextract=()


prepare() {
  mkdir -p "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"

  #patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  #./configure --prefix=/usr
  #make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  #make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/wallpapers/"
  #install -v -d -D "$startdir/winxp/" "$pkgdir/usr/share/wallpapers/"
  cd "$startdir"
  wpdir="$pkgdir/usr/share/wallpapers"
  install -vDm 755 winxp_bliss.jpg "$wpdir/winxp/bliss.jpg"
  install -vDm 755 win7_img0.jpg "$wpdir/win7/img0.jpg"

  # from C:\windows\wallpapers\
  install -vDm 755 win10_img1.jpg.aa "$wpdir/win10/img1.jpg"
  cat win10_img1.jpg.ab >> "$wpdir/win10/img1.jpg"
  cat win10_img1.jpg.ac >> "$wpdir/win10/img1.jpg"
  cat win10_img1.jpg.ad >> "$wpdir/win10/img1.jpg"

  # from https://pan.baidu.com/s/1dErLPgl
  install -vDm 755 santi_img1.jpg.aa "$wpdir/santi/img1.jpg"
  cat santi_img1.jpg.ab >> "$wpdir/santi/img1.jpg"
  cat santi_img1.jpg.ac >> "$wpdir/santi/img1.jpg"

  install -vDm 755 10-5--thumb.png  "$wpdir/macos/10-5.png"
  install -vDm 755 10-7--thumb.png  "$wpdir/macos/10-7.png"
  install -vDm 755 10-8--thumb.jpg  "$wpdir/macos/10-8.jpg"
  install -vDm 755 10-13--thumb.jpg  "$wpdir/macos/10-13.jpg"
  install -vDm 755 10-14-Day-Thumb.jpg  "$wpdir/macos/10-14-Day.jpg"

  install -vDm 755 PKGBUILD  "$wpdir/hurd/PKGBUILD"
  install -vDm 755 .SRCINFO  "$wpdir/hurd/.SRCINFO"
  #aur git repo cannot cantains subdir
  #find "winxp/" -type f -exec install -vDm 755 {} "$pkgdir/usr/share/wallpapers/{}" \;
}

# vim:set ts=2 sw=2 et:

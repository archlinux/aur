# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Joseph Diza <josephm.diza@gmail.com>
pkgname=marwaita-icons-git
#pkgver=r3.d18eeee
pkgver=r3.d18eeee
pkgrel=1
pkgdesc="Icon pack for linux"
arch=('any')
url="https://github.com/darkomarko42/Marwaita-Icons"
license=('custom')
makedepends=('git')
#source=('https://github.com/darkomarko42/Marwaita-Icons.git')
#source=("${_pkgname}::git+https://github.com/darkomarko42/Marwaita-Icons")
_pkgname=Marwaita-Icons
source=("${_pkgname}::git+https://github.com/darkomarko42/Marwaita-Icons")
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

#pkgver() {
	#cd "$srcdir/${pkgname%-VCS}"

## The examples below are not absolute and need to be adapted to each repo. The
## primary goal is to generate version numbers that will increase according to
## pacman's version comparisons with later commits to the repo. The format
## VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
## are not available, is recommended.

## Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

## Git, no tags available
	#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

#prepare() {
	#cd "$srcdir/${pkgname%-VCS}"
	#patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
#}

#build() {
	#cd "$srcdir/${pkgname%-VCS}"
	#./autogen.sh
	#./configure --prefix=/usr
	#make
#}

#check() {
	#cd "$srcdir/${pkgname%-VCS}"
	#make -k check
#}

pkgver() {
    #cd "${_pkgname}"
    #git clone "$source" "$srcdir"
    #cd "$srcdir/Marwaita-Icons"
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	#cd "$srcdir/${pkgname%-VCS}"
  #git clone "$source" "$srcdir"
  #cd "$srcdir/Marwaita-Icons"
  cd "$_pkgname"
	#make DESTDIR="$pkgdir/" install
  #ICONS_DIR="/usr/share/icons/" 
  #sudo cp -rf "Marwaita" "$ICONS_DIR"
  #sudo cp -rf "Marwaita-Dark" "$ICONS_DIR"
  #sudo cp -rf "Marwaita-Light" "$ICONS_DIR"
  #pwd
  #sudo install -d "Marwaita" "$ICONS_DIR"
  #sudo install -d "Marwaita-Dark" "$ICONS_DIR"
  #sudo install -d "Marwaita-Light" "$ICONS_DIR"

  #sudo install -D "Marwaita/*" -t "$ICONS_DIR"
  #sudo install -D "Marwaita-Dark/*" -t "$ICONS_DIR"
  #sudo install -D "Marwaita-Light/*" -t "$ICONS_DIR"

  #mkdir -p /usr/share/icons
	#cp -R Marwaita /usr/share/icons
	#cp -R Marwaita-Dark /usr/share/icons
	#cp -R Marwaita-Light /usr/share/icons

  #sudo install -D "Marwaita/*" -t "$pkgdir"
  #sudo install -D "Marwaita-Dark/*" -t "$pkgdir"
  #sudo install -D "Marwaita-Light/*" -t "$pkgdir"

  pwd
  #install -D "Marwaita"/**/* -t "$pkgdir"
  #install -D "Marwaita-Dark"/**/* -t "$pkgdir"
  #install -D "Marwaita-Light"/**/* -t "$pkgdir"
  ICON_DIR="$pkgdir/usr/share/icons"
  mkdir -p "$ICON_DIR"
  cp -rf "Marwaita" "$ICON_DIR"
  cp -rf "Marwaita-Dark" "$ICON_DIR"
  cp -rf "Marwaita-Light" "$ICON_DIR"

  #install -D "${origin}"/* -t "${target}"
  #sudo install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

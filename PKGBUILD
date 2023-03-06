# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Joao Chamine <jchamine@outlook.pt>
pkgname=xnotes-git
pkgver=1.1
pkgrel=3
epoch=
pkgdesc="Simple notepad created in python."
arch=(x86_64 i686)
url="https://JoaoChamine@bitbucket.org/JoaoChamine/xnotes.git"
license=('GPL')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(Xnotes)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
	cd "xnotes"
	sudo mkdir -p /usr/bin/xnotes
	sudo ln -s /usr/bin/xnotes/Xnotes /usr/bin/Xnotes
	sudo mkdir -p /usr/share/applications/Xnotes
	sudo cp res/*.desktop /usr/share/applications/Xnotes/.
	sudo cp -r img/ /usr/share/applications/Xnotes/.
	sudo cp -r img/ /usr/bin/xnotes/.
	sudo chown jchamine. /usr/share/applications/Xnotes -R
	sudo chmod 744 /usr/share/applications/Xnotes -R
}

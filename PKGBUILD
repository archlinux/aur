# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: wore <wore@foreveralone.tokyo>
pkgname='msm-git'
pkgver=0.0.0
pkgrel=2
pkgdesc='Minecraft Server Manager: A single init script which makes running multiple Minecraft/Bukkit servers easier for us admins.'
arch=('i686' 'x86_64')
url='http://msmhq.com/'
license=('GPL3')
makedepends=('git')
source=('git+https://github.com/msmhq/msm.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
package() {
	cd "$srcdir/${pkgname%-git}/installers"
	./arch.sh
}

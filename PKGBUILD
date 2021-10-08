# Maintainer: Esmail EL BoB <aur.valj8@simplelogin.co>

pkgname="wine-roblox-bin" # '-bzr', '-git', '-hg' or '-svn'
pkgver=r2.9e56722
pkgrel=1
pkgdesc="Wine-tkg with custom roblox mouse patch"
arch=('x86_64')
url="https://github.com/EsmailELBoBDev2/wine-tkg-roblox-mouce-patch"
license=('GNU GPL V3')
makedepends=('git')
md5sums=()
depends=(
    'attr'                  'lib32-attr'
    'fontconfig'            'lib32-fontconfig'
    'lcms2'                 'lib32-lcms2'
    'libxml2'               'lib32-libxml2'
    'libxcursor'            'lib32-libxcursor'
    'libxrandr'             'lib32-libxrandr'
    'libxdamage'            'lib32-libxdamage'
    'libxi'                 'lib32-libxi'
    'gettext'               'lib32-gettext'
    'freetype2'             'lib32-freetype2'
    'glu'                   'lib32-glu'
    'libsm'                 'lib32-libsm'
    'gcc-libs'              'lib32-gcc-libs'
    'libpcap'               'lib32-libpcap'
    'faudio'                'lib32-faudio'
    'desktop-file-utils'
)
optdepends=(
    'giflib'                'lib32-giflib'
    'libpng'                'lib32-libpng'
    'libldap'               'lib32-libldap'
    'gnutls'                'lib32-gnutls'
    'mpg123'                'lib32-mpg123'
    'openal'                'lib32-openal'
    'v4l-utils'             'lib32-v4l-utils'
    'libpulse'              'lib32-libpulse'
    'alsa-plugins'          'lib32-alsa-plugins'
    'alsa-lib'              'lib32-alsa-lib'
    'libjpeg-turbo'         'lib32-libjpeg-turbo'
    'libxcomposite'         'lib32-libxcomposite'
    'libxinerama'           'lib32-libxinerama'
    'opencl-icd-loader'     'lib32-opencl-icd-loader'
    'libxslt'               'lib32-libxslt'
    'libva'                 'lib32-libva'
    'gtk3'                  'lib32-gtk3'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'vulkan-icd-loader'     'lib32-vulkan-icd-loader'
    'sdl2'                  'lib32-sdl2'
    'vkd3d'                 'lib32-vkd3d'
    'sane'
    'libgphoto2'
    'gsm'
    'ffmpeg'
    'cups'
    'samba'
    'dosbox'
)

pkgver() {
	cd src/$pkgname

	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}


build() {
	cd src/$pkgname
	git clone --depth=1 https://github.com/EsmailELBoBDev2/wine-tkg-roblox-mouce-patch .
    sudo pacman -U wine-tkg-staging-fsync-git-*.pkg.tar.zst
}

package() {
	echo "Done -- now please update your system (sudo/doas pacman -Syyuu) and install roblox via grapejuice"

}

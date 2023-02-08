# Maintainer: Mohamed Ahmed (Sego) <sego at sego dot app>
pkgname=wine-tkg-roblox
pkgrel=1
pkgver=8.1
url="https://github.com/Frogging-Family/wine-tkg-git"
source=("roblox-wine-staging-v2.5.patch::https://raw.githubusercontent.com/NyanCatTW1/robloxWineBuildGuide/1ac0a104e3f6c691021662ec659e8185071f2383/roblox-wine-staging-v2.5.patch"
	"use-wine-81.patch::https://github.com/SegoGithub/wine-tkg-git/commit/7296259b6dfa640da2f810eafd19ddaa2c5d92b0.patch"
	"git+https://github.com/Frogging-Family/wine-tkg-git")
pkgdesc="wine-tkg-git with patches for Roblox"
arch=('x86_64')
sha256sums=('SKIP'
	    'SKIP'
	    'SKIP')
license=('LGPL')

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
    'desktop-file-utils'    'jxrlib'
    $_user_deps
)

makedepends=('patch' 'git' 'autoconf' 'ncurses' 'bison' 'perl' 'fontforge' 'flex'
    'gcc>=4.5.0-2'          'pkgconf'
    'giflib'                'lib32-giflib'
    'libpng'                'lib32-libpng'
    'gnutls'                'lib32-gnutls'
    'libxinerama'           'lib32-libxinerama'
    'libxcomposite'         'lib32-libxcomposite'
    'libxmu'                'lib32-libxmu'
    'libxxf86vm'            'lib32-libxxf86vm'
    'libldap'               'lib32-libldap'
    'mpg123'                'lib32-mpg123'
    'openal'                'lib32-openal'
    'v4l-utils'             'lib32-v4l-utils'
    'alsa-lib'              'lib32-alsa-lib'
    'libxcomposite'         'lib32-libxcomposite'
    'mesa'                  'lib32-mesa'
    'libgl'                 'lib32-libgl'
    'libxslt'               'lib32-libxslt'
    'libpulse'              'lib32-libpulse'
    'libva'                 'lib32-libva'
    'gtk3'                  'lib32-gtk3'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'gst-plugins-good'      'lib32-gst-plugins-good'
    'vulkan-icd-loader'     'lib32-vulkan-icd-loader'
    'sdl2'                  'lib32-sdl2'
    'libcups'               'lib32-libcups'
    'samba'                 'opencl-headers'
    'meson'                 'ninja'
    'glslang'               'wget'
    'ocl-icd'               'lib32-ocl-icd'
    'jack'                  'lib32-jack'
    'libxpresent'           'libgcrypt'
    'lib32-libgcrypt'       $_user_makedeps
)



build() {
    cd "$srcdir/wine-tkg-git/wine-tkg-git"
    git apply "$srcdir/roblox-wine-staging-v2.5.patch"
    git apply "$srcdir/use-wine-81.patch"
    makepkg -si --noconfirm
}

package() {
    echo "IGNORE THIS  package() is not used because it enters fakeroot environment and makepkg doesn't allow running makepkg as root"
}

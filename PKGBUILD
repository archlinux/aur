# Maintainer: Mohamed Ahmed (Sego) <sego at sego dot app>
pkgname=wine-tkg-git-rbx
pkgrel=1
pkgver=2.6
url="https://github.com/Frogging-Family/wine-tkg-git"
# my fork of the patch uses wine 7.19 which is NOT the latest version of wine
# Wine 7.20+ doesn't work with 0002-proton_LFH.mypatch
# https://github.com/Frogging-Family/wine-tkg-git/issues/889
source=("https://raw.githubusercontent.com/SegoGithub/robloxWineBuildGuide/main/roblox-wine-staging-v2.6.patch")
pkgdesc="wine-tkg-git with patches for Roblox"
arch=('x86_64')
sha256sums=('SKIP')
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
    cd "$srcdir"
    git clone https://github.com/Frogging-Family/wine-tkg-git.git
    cd "$srcdir/wine-tkg-git/wine-tkg-git"
    git apply "$srcdir/roblox-wine-staging-v2.6.patch"
    makepkg -si --noconfirm
}

package() {
    echo "IGNORE THIS  package() is not used because it enters fakeroot environment and makepkg doesn't allow running makepkg as root"
}

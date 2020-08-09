# Maintainer: Antoine Damhet <xdbob at lse.epita.fr>
# Original-Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

_pkgname=obs-studio
pkgname=$_pkgname-wayland
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgver=25.0.8
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording (with wayland patches)"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls'
         'qt5-svg' 'qt5-x11extras' 'curl' 'jack' 'gtk-update-icon-cache')
makedepends=('cmake' 'libfdk-aac' 'libxcomposite' 'x264' 'vlc' 'swig' 'python' 'luajit')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libxcomposite: XComposite capture support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'python: scripting support'
            'vlc: VLC Media Source support'
            'wlrobs-hg: screen capture on wlroots compositors')
source=(
  $_pkgname-$pkgver.tar.gz::https://github.com/jp9000/obs-studio/archive/$pkgver.tar.gz
  https://github.com/obsproject/obs-studio/commit/8a1429e29ebd6bf31ad6ae63c6992e2c03893767.patch
  0001-deps-glad-Add-EGL.patch
  0002-libobs-opengl-Rename-gl-x11.c-to-gl-x11-glx.c.patch
  0003-libobs-opengl-Factor-out-GLX-winsys.patch
  0004-libobs-opengl-Introduce-the-X11-EGL-winsys.patch
  0005-deps-glad-Make-X11-required-as-well.patch
  0006-ci-Install-qtbase5-private-dev-on-Linux.patch
  0007-libobs-nix-Move-X11-specific-code-to-obs-nix-x11.c.patch
  0008-libobs-Introduce-the-concept-of-a-Unix-platform.patch
  0009-UI-Set-the-Unix-platform-on-startup.patch
  0010-linux-capture-Fail-to-load-when-running-on-EGL.patch
  0011-libobs-Add-a-Wayland-platform.patch
  0012-libobs-opengl-Try-to-use-the-platform-display-if-ava.patch
  0013-libobs-opengl-Introduce-an-EGL-Wayland-renderer.patch
  0014-UI-Retrieve-Wayland-surface-from-QWindow.patch
)
sha512sums=('a97c03dc218a4e03e48f6a7dc82b4a59ebeee2039f17be66bb847681ce9ff3d25e6e015be4af78fe44739f6fad5089b6e683d7657c2e4fde8e547df9a2594a08'
            '1ff0e088eed61554268009f3d8c5a23c0888bfbe860d6cb288ddf348108446c152fd87e2cb8f54613a88378d8474550632c90f924005d5e0343bf1a801339ccc'
            'bfe2b0e6da69ffdca95229eb4015515148fdda909355add1d2dec71cf97e9fdabdfc832c74f455a890846708f28d5bcbec64589e853904d539a438b2dcbd7a18'
            '5221b6a7a46f99c58cde1c5406f83d50def2d5b3a2e97be7db759d94d74a5be46da092209e6a4122a6de4b704632c3f013535f80b570349b029ea4124151c4f6'
            'c9a0660c95bd18a02620fb0b870032563669544e7a721e4d91dafb8aebb96d1735414a9e37ed56355fc5afeb8f437a434b4fd5f147c9658cc6974e8e8bab4463'
            '0b404ff252f94bcdd957d43db26c54c6b47de5a8f810f4febdb0aa5b873c48f23ef2817361e5ce9c09a189e770978cfca24767167604434ece771d759e7c4270'
            '47f5bffb469ece2b961000cd2d8656b82cba8ac0fa09fa7703c662e0cee2e48744d5b8aa93a4b4508436ea5edfe3038fa7aa88a3b43466f88c7504e6a8ba51ed'
            'd15c21968a3024888ce4c8e884d861f147358e95a42c1de557251a4c2fccbdddf9cf5a285deedbf73cffbd25fdaad44dd972cb10bf9a5b23a0049b239e75961f'
            'c1f94ccd836c51ff83735df614bf6d3e2c310c599685e700ae5726ace20434edd04ef0c9be0a8c0f4c458dd164ad1ac817fd32bcbeeefb0107a6ce4cbce9cb08'
            '6ce870404a6d2bfbb25935a6da59a07447307f8592dd1dc1aaebba2b9f959633565ba4cdc7d50ee3c4e5b4c169397298daa5804c3060fc780dba52099f687393'
            '6374229b662949e2989eb372a922fda872d2a08e817690b2262f99dc8a02261a75aeeacfc40da2b68a04228b38cda4aeaca4212068e8605b7532662dc459abb4'
            '16dfa319e9e18ef8e946b9723e27d1ea1f56e4de8656d8112571bc87aa7ade8dbda4293f064c2477cdaf92c60fca4484b2c7ac322835bf402657275933f6ab52'
            'c81a421475293d3d5c64a744c10a925dc26975a6dfd46e1b3b2a92931da43c311d0a153548889b4e9831bee61ab8b0f5fc504ad3f0ed7f0628f93287e12ad3d3'
            'ea36fee6228d582f5f3b886a3de61ad8b139691c3bf30e24a7b20f1eab2f9e43b0dfbf6f254dcef00e2bfbf6826f223a957d3e78524ebd864c64433529e40441'
            'a93f186ed24ee979a4297aa063c435ae541f5f1958b86373f6534a2dd85e2178d6f151f115200c987b5e1d999ebd94d6ce0597ef1e7b3588bcb161c53dd4878e'
            'c4e6a23edf080076c27599e02909a068b11094848f733297496e7ea0061df56be4becdb58449ec7a05ff2a659fa4c0f75f4006cb204578477308d24d764fba41')
prepare() {
  cd $_pkgname-$pkgver

  for patch in ../*.patch; do
    patch -Np1 -i "$patch"
  done
}

build() {
  cd $_pkgname-$pkgver

  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" ..

  make
}

package() {
  cd $_pkgname-$pkgver/build

  make install DESTDIR="$pkgdir"
}

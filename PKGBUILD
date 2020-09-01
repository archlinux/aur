# Maintainer: Antoine Damhet <xdbob at lse.epita.fr>
# Original-Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

_pkgname=obs-studio
pkgname=$_pkgname-wayland
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgver=25.0.8
pkgrel=5
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
  0015-UI-Destroy-display-when-becoming-invisible.patch
  0016-UI-Don-t-create-obs_display-when-QTToGSWindow-fails.patch
  0017-UI-Rename-callback-to-match-signal-name.patch
  0018-UI-Disable-and-ignore-Always-On-Top-on-Wayland-platf.patch
  0019-UI-Make-OBSQTDisplay-CreateDisplay-public-and-allow-.patch
  0020-UI-Check-for-Expose-and-PlatformSurface-events-to-cr.patch
  0021-libobs-graphics-Add-Linux-only-device_texture_create.patch
  0022-deps-glad-Add-DMA-BUF-EGL-extensions.patch
  0023-libobs-opengl-Implement-DMA-BUF-importing-on-EGL-ren.patch
  0024-libobs-opengl-Create-GLES2-contexts.patch
)
sha512sums=('a97c03dc218a4e03e48f6a7dc82b4a59ebeee2039f17be66bb847681ce9ff3d25e6e015be4af78fe44739f6fad5089b6e683d7657c2e4fde8e547df9a2594a08'
            '1ff0e088eed61554268009f3d8c5a23c0888bfbe860d6cb288ddf348108446c152fd87e2cb8f54613a88378d8474550632c90f924005d5e0343bf1a801339ccc'
            'c4e653fc744000e0b178848b21f326065dbc83966876594fd349be9b847382afabd0321081e83f3ef094fe067c97d8200817a6cd752df260874bc943271a8658'
            '2359bb8f074e5e5676eefe4c655d79611c901f0c8316275ced4d711be42f74ea29d0167ad018f51064fb8a51535969ae742c576a8afe9d710116f7379a1ee67d'
            '019fd92b51cb432d81d4265e85751040aeedc1f466181c2e2ec14c253335b1a23571e961ce6415e045fa51ea15731de6e540664276cdd76a3ce198d56cb13eac'
            '2f3186d862a78d41496e5a43dd01f5b56edac9873ea309bdcc8c9a83083437e7a252ef0d7373f403dc70ee4f1be8ae6fc430d710b80222ada7ae3ce16b8103ea'
            '457534c7ffb7dd0064b143cdfe472d079251ebe891885372127cbff2b6cb70e7d1e55a2da7956c5b6d940e03f8efa57265453fa23a8fb9fa92e4b2c33c959316'
            '2af83bba2aa2dd2aed11f9a4f431d9aaeae7c6154c921247510e91bb523cede756d0777fe522a5a6db81a9a6989769a839f365e698511890308c5a0ec6e695ec'
            '3f8094c9e577d81bfc9222e436947aa890ce81b2f0e3e43f979a7192cc3e1ca35ca63949e061cecdc6be0579636b6a8e0d8ba21a05a0e11a94ba42210fff851a'
            'd0ff4c1bcb156b2c81be38682d4f99b1388d25521f7981016e850f1e8989d0bfe0d3d71d4ec18382f861ca889bcdfb27dd4d73ca7f763f997a5e388bbc8bdcbc'
            '061f7122d5ff8a98dd4ef875c2d7dc60a2dc30627a01a960bd78539e6c7f2bcbfda48f9f42f9f61434f6263686641af2cfb4d6971682be542b6c6f037986e6da'
            'a91815239465656a0ab5902e524277659e0e3ab953d0539bc8ead8f65b3a279a801c02635aad541f871f5007943af704c8c64fec90534c66fe6e418d24787300'
            'e3bdcdae93fa134c1174bf84152385ae28eb7fd82504331f4dccfd46b6565eb605b63acd4972bed08bbe765c7e213b93d94077a9fafcfe33064b4a526f02f7a6'
            'f134c9fed318fde1d11f59e56676cc512bdea81df6a5ce90202759b300405d02981b6586e090cbae65fb730ca352c3942eeec636bb7d5a571475a815f73be89d'
            '530846836b8efc6b7549fb6d2b4288ac9782420fd8e51c988d579f701bc4a1f58b7f941d472ad7d4ab07869e45dfc905c3927a3ad735178a109881ed02ffdb77'
            '014a9dd855e696a33e3b5c8f8a11ec6cf1edc6e0e6478cc5f11530c5535a1d1dfaaa75c5a3de258178e1ab16256fb8303b18c8a69407febe58a7d860b2396fda'
            'afb5a5b0cfa09407efe6924b37f8c3b26ccf244acc4a99fcee0eb6705855d2dc8589ecbdb2fcf9066c9ec6d947a6810f58efe34362aa451af4cdf7fa30f2e4e4'
            '5a09040d91bf293389c328f758416f29840eaf6b0acd78adf14b47fc48c417fb1b02ab97dc90c7d8381bc9ffa817cbc6acc83fd318ba85d73d39ae8f4f7a35e1'
            'd1ed4b6bb07b2da105e2d69c5af1d61bcd39f141c2500e606f251f2220632f4173d3b3de9e2c88dd0bf2e230cba291cda50fb3a7ca89ff391d0e5e36b2e4aa2f'
            'c5b82ddaad7bcc5608168a318e6dde9a0aa0d1dc789d29751a9b22bec2b68288c71e5719c620073ee3c8d9bbf63d60e1634a351cc155b8f2b823d0cbc83cf578'
            'c9d1e42cb87964b764a70044aa828c8d712c709d9e1245f644e8aa2f4576cd33c78e81b9b736d39939959aa3811fe4a9cb6970c8278c22d3f5b7f48d43ae1d55'
            'a9893913797b503249d182ebbac0452827a837187e7817c46ab76df5d004ada810c2ff8523518d408daf396a4c72f707777a3dadeca598f404b074581f0125e8'
            '848bcf4f525cca508131960fe6bb2757b0975065f680da9c8d692b5ea28b4c5cca7c2e71f1498c8425c0549fc23a41895638da9e1c433d05e6425ea36dc3ec1b'
            '71e11ef607a0371c378db0d50155530d2a918ca47fe15dd29dab36f50dda4a8e7a487f3600b4b03a240db4e84b73c5b49186ca275fb1968de8f15c8d16e8a813'
            '73b82cd530e26d3751de9d3e54da0994cbd5d7c9e5ceed7088d50ef4eda8a8c36d30812e8e4a82be014813ed09aefcfa14e7361189a7b4cf763f20aa2ebda7b7'
            '1442f7918df45b37e9b3bef05573d4f8c7224f950a85fd0b6200a2ca70b377344ecf37ed69b5474453f584d0992b446383b1a708c326e993a9c815882ba4232f')
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

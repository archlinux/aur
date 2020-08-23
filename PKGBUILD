# Maintainer: Antoine Damhet <xdbob at lse.epita.fr>
# Original-Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

_pkgname=obs-studio
pkgname=$_pkgname-wayland
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgver=25.0.8
pkgrel=3
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
)
sha512sums=('a97c03dc218a4e03e48f6a7dc82b4a59ebeee2039f17be66bb847681ce9ff3d25e6e015be4af78fe44739f6fad5089b6e683d7657c2e4fde8e547df9a2594a08'
            '1ff0e088eed61554268009f3d8c5a23c0888bfbe860d6cb288ddf348108446c152fd87e2cb8f54613a88378d8474550632c90f924005d5e0343bf1a801339ccc'
            'df2a3b13a66603546bc39c070bbbe55d2ef0e6620fea98e773955713ef74c6817649713da76548d24a4160f4af327e132205cbeb2f90959690aa3321945284c4'
            'd15612ba51364c9ba49096a3aa8d2002d739b81cae090586254fc1351723cabfd80a09d76834b71f6d49abcc50e33dda52f183dd3a5e87a0d740ce57dc2cb583'
            '43e67659200e077a6dc624f94ed9cde5a31ae7bcd403b9ea649fb0277b3a1964b4f11a4ad45d754fc571b71c3cca42ca0a843bd484229a64a41d3f96efa03aca'
            'dfd8687f3aaae32161998075923905bc2c3111b299132d398efee5771fb0b681a96f1ee367b6955e66935df8b2f9cb59466b5c209768b04bf4c6af177c4b8621'
            'b47ee46b3bdb6de606fb667d17536fbede200be86021c983259c131fe9f463b3101e419ea8ed30f0a99163877d2e939f44b9e7fd2d213cc4c203da64813117d1'
            '8b6e5f32ebfca1f163d69144e3752b409be8b3747ff46b9f9cecf0140247fffc8728f49cfcf0f71e2b514ff8e516bf441cdd421dff6952d30f65a8adfd4526e3'
            '62f37c7c60067100a8594306e5fa6e65003063fc3d35d8b7daa7ead2f50ae17677f54dc9f8ac206ef20ca1178ddfb68948893f6d8d56efd0dcc6f147c172c547'
            '5d6e46223f2d08e807040cc8e264d27219ad8b4a5ff580fa568ccbc88f26564f2e72e8400b8c447c226b5f27346206da19081a5ac03512c95a56ea5d6b3924ff'
            '1e77adb183e1bb42260965e1733b88d25ebd885ef4029b8c424dd100485fcd882f676a75d396cc7adbbb7c1c4ae9b4f047778d96c4d6d74b5302437059eb0db6'
            'cc853dc74ea961a9253085188f851e3184a53b252f1a85cecd16745b4ab561ea7a47b32bb9475624a2eec51106090a153bdb6ec6680f2ee4bd8fd5a6509ba831'
            'cc712c85b364179794af393634c87ffb3d7d42b360379405ea587485f07e525496ac2da4e97f52a7f2232164e5e70d9442c9b7cc139c85f0405f662ae092b795'
            '4c5733a51dc1070327eadea420ba5acea2ec74a3bac538264969bc5eea2dadee701dd6634737e09b2755eae388fa0969d32738b6ea81b99f66a56db9b6a90765'
            'e61d437cb1b98f50bd5e4404a90f744d05d8a73965554b1ac981ffa534f1a134bdf6714a78a2eb257b8a53675a012e5786bdce3fd16201b9b64191a61cb11373'
            '19e0943462fe6e72a104ed45015b8e2b73a0ffa389f733752b6991e1f69e521682f3095d8c372aa800d13b89b28237aa6d2b1fcd24d4df9da6a6ba2000e07c77'
            'abce43def134860a6953fb2e804541860f3a222fbf2e27956874e77974e70851893078cefdce086f56b5144c885dbe674d060e635f351ef4efc9a1bcd1fcfa1c'
            '55a80e92c70f709ffb42491d61cfc659ba0c682603a8431e915d238495e9ba966b976a195daec0aec79803473d9b251371c4469391f423456d325ab558a0379c'
            '6dea2f711a4871da8dd72faa29f3eb3274e18d24a6bc719461b20fa4b0a327ad16291b8867c9d68d5b911be4016f2d75fa0158df1e55b5fc96f2612574e7ceb0'
            'cef5df381f13456326e844b1f45168f51af37df09227f07bdd800672efce28181c4fdf96798759d139f953b5809850caa3894d2f7a3c29c0a7220dd0b4f60c78'
            'fd3a51462f745169522c5c6a857fe124eebb06331a9ccb1e4dc69e78c300c3b0737d5cb330c9d2b9e8f30aae9d206bbc985c2660aeb7ac1a66cbc9d84187cf06'
            '8a3c9db9d92b76a0388083744ead2eceb955c0c21c8b4242db51a500a6e1454a21725501e0ba1968f63b59b1ea6e83765d84d03b421ec482e8ca37166b03c2ac')
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

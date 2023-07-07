# Maintainer: Paul Sajna <hello@paulsajna.com>

pkgname=mesa-pvr-vf2
pkgdesc="an open-source implementation of the OpenGL specification, PowerVR (VisionFive2) version"
pkgver=21.2.5
pkgrel=1
arch=('riscv64')
makedepends=('git' 'python-mako' 'xorgproto'
              'libxml2' 'libx11'  'libvdpau' 'libva' 'elfutils' 'libxrandr'
              'wayland-protocols' 'meson' 'ninja' 'glslang' 'directx-headers' )
depends=('libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
         'libomxil-bellagio' 'libunwind' 'libglvnd' 'wayland' 'lm_sensors' 'vulkan-icd-loader' 'zstd' 'expat')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=('mesa' 'vulkan-mesa-layer' 'vulkan-driver' 'mesa-libgl' 'opengl-driver')
conflicts=('mesa' 'vulkan-mesa-layer' 'mesa-libgl')
url="https://www.mesa3d.org"
license=('custom')
source=("https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz"
       '0001-Add-pvr-dri-driver.patch'
       '0002-Force-Mesa-to-use-the-PVR-driver-for-platform-device.patch'
       '0003-dri-Add-some-new-DRI-formats-and-fourccs.patch'
       '0004-GL_EXT_sparse_texture-entry-points.patch'
       '0005-Add-support-for-various-GLES-extensions.patch'
       '0006-Add-EGL_IMG_cl_image-extension.patch'
       '0007-egl-Be-stricter-when-making-a-context-current-withou.patch'
       '0008-egl-optimise-eglMakeCurrent-for-the-case-where-nothi.patch'
       '0009-GL_EXT_shader_pixel_local_storage2-entry-points.patch'
       '0010-GL_IMG_framebuffer_downsample-entry-points.patch'
       '0011-GL_OVR_multiview-entry-points.patch'
       '0012-Add-OVR_multiview_multisampled_render_to_texture.patch'
       '0013-wayland-drm-install-wayland-drm.xml-to-the-configure.patch'
       '0014-Enable-buffer-sharing-in-the-kms_swrast-driver.patch'
       '0015-egl-wayland-add-support-for-RGB565-back-buffers.patch'
       '0016-egl-dri3-fix-segfault-in-eglCopyBuffers.patch'
       '0017-egl-automatically-call-eglReleaseThread-on-thread-te.patch'
       '0018-egl-add-Tizen-platform-support.patch'
       '0019-egl-add-support-for-EGL_TIZEN_image_native_surface.patch'
       '0020-egl-wayland-post-maximum-damage-when-blitting.patch'
       '0021-egl-wayland-flush-the-drawable-before-blitting.patch'
       '0022-egl-tizen-create-an-internal-_EGLImage-for-each-tbm-.patch'
       '0023-dri-use-a-supported-API-in-driCreateNewContext.patch'
       '0024-gbm-add-gbm_bo_blit.patch'
       '0025-gbm-don-t-assert-if-DRI-context-creation-fails.patch'
       '0026-egl-wayland-add-pbuffer-support.patch'
       '0027-egl-tizen-support-DRI-driver-handling-of-swap-preser.patch'
       '0028-egl-eglBindAPI-workaround-for-dEQP-bug.patch'
       '0029-GL_EXT_multi_draw_indirect-entry-points.patch'
       '0030-dri-add-support-for-YUV-DRI-config.patch'
       '0031-egl-add-support-for-EXT_yuv_surface.patch'
       '0032-dri-add-missing-__DRI_IMAGE_COMPONENTS-define-for-EG.patch'
       '0033-egl-wayland-expose-EXT_yuv_surface-support.patch'
       '0034-egl-tizen-expose-EXT_yuv_surface-support.patch'
       '0035-gbm-add-some-new-GBM-formats.patch'
       '0036-egl-add-null-platform.patch'
       '0037-egl-add-config-debug-printout.patch'
       '0038-egl-add-support-for-EXT_image_gl_colorspace.patch'
       '0039-meson-force-C-2011-for-thread_local.patch'
       '0040-dri2-add-support-for-swap-intervals-other-than-1.patch'
       '0041-null_platform-add-support-for-explicit-synchronisati.patch'
       '0042-egl-null-add-support-for-DRM-image-format-modifiers.patch'
       '0043-egl-query-the-supported-ES2-context-version.patch'
       '0044-meson-allow-libGL-to-be-built-without-GLX.patch'
       '0045-egl-wayland-process-non-resized-window-movement.patch'
       '0046-Separate-EXT_framebuffer_object-from-ARB-version.patch'
       '0047-egl-null-add-support-for-async-flip-with-front-buffe.patch'
       '0048-gbm-add-pbuffer-support.patch'
       '0049-egl-null-expose-EXT_yuv_surface-support.patch'
       '0050-dri-preserve-the-original-FD-for-driver-use.patch'
       '0051-egl-wayland-a-linear-buffer-is-not-needed-with-DRM-f.patch'
       '0052-dri3-a-linear-buffer-is-not-needed-with-DRM-format-m.patch'
       '0053-egl-drm-add-support-for-DRI_PRIME-GPU-selection.patch'
       '0054-egl-null-add-support-for-DRI_PRIME-GPU-selection.patch'
       '0055-egl-null-introduce-NULL_DRM_DISPLAY.patch'
       '0056-vulkan-wsi-check-the-DRI3-and-Present-XCB-reply-poin.patch'
       '0057-vulkan-wsi-Allow-host-visible-memory-to-be-requested.patch'
       '0058-vulkan-wsi-make-the-display-FD-available.patch'
       '0059-pvr-wsi-add-PowerVR-Vulkan-WSI-library.patch'
       '0060-vulkan-wsi-Disable-use-of-VK_EXT_pci_bus_info.patch'
       '0061-vulkan-wsi-default-to-force_bgra8_unorm_first-true.patch'
       '0062-vulkan-wsi-enable-additional-formats-for-Wayland.patch'
       '0063-vulkan-wsi-enable-additional-formats-for-Display.patch'
       '0064-mesa-main-dri-add-YUV420_3PLANE-and-YVU420_3PLANE.patch'
       '0065-egl-null-add-support-for-YU12-and-YV12.patch'
       '0066-mesa-partially-revert-pbuffer-attribute-removal.patch'
       '0067-egl_dri2-set-pbuffer-config-attribs-to-0-for-non-pbu.patch'
       '0068-GL_ARB_geometry_shader4-entry-points.patch'
       '0069-LLVM15.patch'
    )
md5sums=(
'63ef94beb6677db0c5a43289e7e76ba4'
'c6dd89f528eaa1ae111d1dd0560fd29d'
'394e2320285750b926ec4733f9e0b067'
'e1262298e4c09a71029c49aba53f4523'
'f3855585a6907fa98a381fbf6fae3055'
'ba22384ff7a1bf159e0e8915020efc6b'
'89f758d4d57d6eea9121cfc51eae457a'
'1309bca4acb272db97444730829d0e76'
'1eb526f2cbb5cf911bf11be578f4ae6f'
'88dcce3f8192a27e2f921017c84a677e'
'036d9112b98d1278cc30e1f1fa4979cf'
'22c94b54a3d5b35506c11d6012c13ec5'
'9e3fb2fd882c3ce5767f54d9be702db9'
'b7feca5688455f6b54112413893bf7e5'
'9963ea6f2198a0b036aab698c181cf7b'
'c640242edc812aca05464a993d70550c'
'67bc04ec6c29c445e03d686e76d7e4f4'
'1c994ab2b9697e1e7c31f0639f737249'
'6b47c7a3b9dbe6fd9e5a224987edfd2d'
'959d3ce2a010f9cb0316ec5e993501d8'
'4d7fc8cb70babc2741363eef5bb9100d'
'05429d3d5864a7f5be9d7d8e1b9477f2'
'9bc51d4c426c3e3b18c2d5e35868554d'
'4b9d271fc5944a28a93ba987e1759342'
'938fff17835ab8237738872672e6b49f'
'06479048cc6a46ff8037612621f0a4be'
'27d94c42ccebad500cb896f5298df7c6'
'c84f323bbec6d6ca0fd8042d17975efe'
'935265d712e7c5c02d4f6a7ddd0eb428'
'c6a77c0d902f8c0ba2279d1510f033d8'
'63ef5a2ff18c43ef2f1138757d521184'
'ba5336b6a614d5402e01562343a6e133'
'e365c1144f0c7257d06d72a534ee5b0f'
'60381ac8c6fcb22a38d509a89002c596'
'b5d250afda2142fb15c4122ed740437d'
'a035800f29efbbc751e823b7aa55d040'
'cbb90f86444345c8f8748f45f6213be8'
'b32004a919c376c1212fda276fc77c8b'
'185ad643674d4091166ac66a2cb69cc6'
'84579044422d60948feb438442162b36'
'c4684bbd6a5a771154583964ebfb6352'
'391748bfda7e9a228370afc1d27c6516'
'cb2159624a7a7e1ce36964a13e27e9b1'
'4de939dcd3f7e19d9158bad123c0082c'
'd884578a85608d80826ebd1ec0c7279b'
'27bc2ad4ccbf5fba48eea91b3204ab25'
'c81dec3af5f6293b48b3526bb7795035'
'f3556b978ed53b9b8d74ee0ab3003e4a'
'9ba52f27dd0afc453351211f983bad37'
'84101639ec3f35e2c12b9e1970be7eb1'
'980a5e9f104db490d41db7380ce04c78'
'8f54db3e0693f61e6e361ede39fd752d'
'268d6758668417bdf32ba000cffdd569'
'ea9deaf6e337832c52d9b423a8dd84ce'
'b4a7e9c8c15d30ad4b11dc77a77df91c'
'74fee9881fdf6b5d3b80da72efb4625d'
'6d88382781e249f4c2645891348c1dd3'
'2dda59b621b3a064ddbd2768b0ff68d6'
'2e97efb5351944b761c9a6efdfadda79'
'85c3256b5327233d6c906a2828f950d6'
'15732e69358095115512ac06ae91a1cf'
'f5bfa3851bdf603d873ac1670d0ac632'
'bddd360ed6825060046f6e69ba7bd268'
'6bc7700341471649a9f7cfacf27e52ab'
'd26fff7c91b8dae629f9fbbd3e4321da'
'8c4f2b7dede0c737b5f544606b9fd0ec'
'4d852725f9eabc9dff1e62db93d835d4'
'7b98e9e7edafe0b8496cc1408f34866b'
'5b2ac4d79c33fa71f29db25047152576'
'46a08d47150adcfbc4fcb2da9c4a0967'
)
sha256sums=(
'8e49585fb760d973723dab6435d0c86f7849b8305b1e6d99f475138d896bacbb'
'effc4cc39e9f07ac2f4f32f2b69e874b3be71b993bea98f36bae56a2d92a2056'
'5aff6dc45847047657ef25de37f38afa183307344e2ca971a748c76534375903'
'cb762c0c0291f4edb346d8eb9ff42b6cd5863246d242f24696f8ce76f77cc80f'
'c28e5a746295dd306646bdf442c027d69beef74b2921b6dc220773e96c98afa6'
'8a66d235851395c67f03adacac78e1eb24de671d5e31b93d7ab96ccf5fb8cde1'
'c4516f2f1a14d51f3122a23d774b922877c6234efb6b76b1e02f34d9d8e210fd'
'01d50fa1b8408bb4dce04c062fd5cd129c6b9a28c7887b332639ab5147e3307b'
'554ad2eb70da28206578ba5b37ad5bee66e4522aa1b95c2ad8dcc6ee259a639f'
'02d60fb77164d5f252b8d9740dacd9200707ce50b4c0f8bcd593f42fc7c2ea42'
'923160ffc44e94556fdd039f1c5233d87e6b5aaed538c98189d3cade74454a28'
'9a3a20aa93e6ccf929c577207cb2cb0bceda69529b4e178aebb5fc3b013f605d'
'47f22515c4d9af34d0d98b8d743a5c20145018343d2e32f2762753cce669634c'
'69f7330f8d233a43dddd794986472bdef60c3ce090b02583a3c270e8b69a2835'
'1cc591071ee7c83d37b1b7ed6d01cfabace9fd45dcc8784bdfe414314fcce7fc'
'6b28333df7049d62e311381104b12e46592eb23a3a4a734650775f42699225a7'
'd6e7d43493e0161fff738fe348226dc65f357c4723a602d2b260728339fa9d31'
'724d49a26feae054a135bfeac0fd3db86b92aad954557e182a2bc0beab66399b'
'16d5beaee105fa2d13b4151b42ab65f49894acad3f5e459597f74f299e09f838'
'4a91646568703570e7e99aa41eda6f5741a7b4dfb7a7753458b985b0ba793f03'
'21c8e315a97edc0f8fea946da3129ddd2602731dcb2ce63328609d179d4f3f7b'
'86a067a9242b447b456bb5fcdd04cc0876cd7af4c14133db6afe872c7f3c0b74'
'7466c707240b334b87a3ebefd88f4e2900533836443961e68a3ebd28b2b528e8'
'b41e221457e7c1950e45dae8bc9275a2a46ff48e671da48863d49577ac53e938'
'39211766753de0327657af272591ab669748a2adee0396fccf7e7c82e81fb094'
'a30359ff20a40184990c885a499cee2bba7f41744cd9e85ca6f53aefb5b7058a'
'87d2abe7761d9ae2885786085ff5c5d91ffe774ff5f51e3de970d1c78dc88710'
'93f841785e1e7bf6e28e81df5b7fb18a39afa6e7a451dd74de99da6679ee7eb5'
'ecf6ad01c94b914b4da422284a02491258a92217ad5688e9470d52b23ca582c2'
'e33fb2153b0e24713eeb838a34312519263168345749171bdca9ef2c47ed0aee'
'2b7958f4e7f4da316d2aa70632fea9c7c807a849b5ddb711026a77c9d40e87dd'
'e2aba51625c91eb5a226efc0243623bde1e8489366c7dfe800c8a8a6cc55787b'
'642728801a5f5ce7080de43906001bcce1b4994690a999133f32de06ee2f8b73'
'2b0d376d84f537d1d6b7c18e8aac2a874a29673d05a2703dbbb98c499f7253cf'
'2e898f77cd249fc428f50f9e73446eefe7ead4151dbcc2a0c714fb6cc6723654'
'4af5ddf9129f9bd60ff47c9cfb12b5ef99b0d89746844eabd4329e9bdc8cde8f'
'b03b9fc91054f8ccbfa8e71089da5c7aa1c3b227ecd4afe6d65906106bdbf908'
'f867dbc92d74600cdc6bca3912b08ad587b1b19a7bf3fd5a99a5ab56893e0322'
'0d10438a18187696a4d317af8eed963c98ab0f1c62c602bd5aa5bf96b019fd72'
'a08c40d36e68dbd6a1e4d549e3d4eaffc33a4ae5714268462affd613e4afcabe'
'a6fcd9c1c603cabbc1028ca8807025aab801bccdc1a0c3436fca187772db8406'
'5e606b9525fa4b13cc076b6bb787bba58c27ab8f0e996d235b190cd036453d2a'
'2e76d78ba3f3368af27a44cefe3bb14e32ebe7947742ed8445ebcef6d1591f1c'
'30ad8552616bbe443ab7f94d88819d6b60362458b3efcae9fae36fd02f301709'
'd7af0ab993cfe12febcec0aac042848747350050132a405fb5d54e0d3cdd1f5f'
'9bf2d04d75897e41a979e5e68d547ac2943f2d1da77005e0360a5b7dda5bb7b6'
'e15e2f03d023cc50d41386efb4031ebeb01d92e8e0bde1987d2d7238c14efe8a'
'f06dd3887bf7967b42f8ffa02bd7a0582e94b80ab22357b9c9cbc1a95278d9f3'
'95aefe98ea5b7871f43efeff93c1f4abbd3d4eae640f6c91063250bbe0cb0aec'
'ed063895a79af7b1197e6bc29aeb3335d0d1bc9d783c2e0689ff05cda2b02150'
'7f111640db3cdd7c7108f2ef4e3dd7188a5b26af20d1032b9d9758d386270548'
'1ffe66aa7dfb4a929b63d90b7bf0c395f95e6eae6b1282a1486ae8b2453c0238'
'86fbb90a2ec528ab700a6573a02b4b62a3415a206ae519fb469e35b3dbff31c4'
'de6458cbb7b5f1ee3fdc44c45004381722c04f0633ad1cd9c5b68c6c841fa4f7'
'12b78bc6c485484acbd12f15762eb2612db4f88a7acbb003cac078447981bc35'
'3d70083b28a32c8b84322688208446422bb8e5f989201afac9659b9ae371e45a'
'2d1792c7fd193d02a59cf6520b5c9495797dc52d8558c71581e822901385c11e'
'14ea92b89761b4872a043828c797dfd222343f4ed5be0cd054a8df1e9daaa24f'
'691512f30e77dc391e1be88c0136cdb3ac677bc5d3803c6cb161bdfe87878ac3'
'212ee1d3601b345054abd9dcdbfa71cb983436332e5ca3b88e890b9f4e97c739'
'f5dd9db93fd74c411daaff2084747c3dfe01a0df0451cd058ecf8a8d3b0a879b'
'97b0dc456cff714779c2523c2b29b2488eaffc50b3bbcb3b3f1f850ee9c787d8'
'bf0589d2a024e4e8f9c6da0d4df5135e957cf1ffd685d921d9e873e6c547cbdb'
'ddc13dc75477761c1e0c44519f69201472cc13861f3ab4335391d86f9e02761f'
'417e5f191fb1cdf7659d5eeca8f04505314b9db7bc5b5563a39e7e066aee091f'
'7c54e2b2a4176fd760f321db48eae0f8efb9e342581780db037f8fcec567fc2e'
'b66ba7f6d58469fc98cf20ad42134d09b02340bdec6d189783b051a494e398ba'
'4b5a3801c1489fdfe975d9b1789e5b16e543d704dcd9344963b748c37e6ff6cc'
'a698d554efed988a85b88169b4cff1ef9d6189004d57800f1c1e923f443f0661'
'420ae64542bb89ca363979d69449498995cde0d6d58b53f69a5d95cc9d4dd1b3'
)


# NINJAFLAGS is an env var used to pass commandline options to ninja
# NOTE: It's your responbility to validate the value of $NINJAFLAGS. If unsure, don't set it.

# MESA_WHICH_LLVM is an environment variable that determines which llvm package tree is used to built mesa-git against.
# Adding a line to ~/.bashrc  that sets this value is the simplest way to ensure a specific choice.
#
# NOTE: Aur helpers don't handle this method well, check the sticky comments on mesa-git aur page .
#
# 1: llvm-minimal-git (aur) preferred value
# 2: AUR llvm-git
# 3: llvm-git from LordHeavy unofficial repo 
# 4  llvm (stable from extra) Default value
# 

if [[ ! $MESA_WHICH_LLVM ]] ; then
    MESA_WHICH_LLVM=4
fi

case $MESA_WHICH_LLVM in
    1)
        # aur llvm-minimal-git
        makedepends+=('llvm-minimal-git')
        depends+=('llvm-libs-minimal-git')
        ;;
    2)
        # aur llvm-git
        # depending on aur-llvm-* to avoid mixup with LH llvm-git
        makedepends+=('aur-llvm-git')
        depends+=('aur-llvm-libs-git')
        optdepends+=('aur-llvm-git: opencl')
        ;;
    3)
        # mesa-git/llvm-git (lordheavy unofficial repo)
        makedepends+=('llvm-git' 'clang-git')
        depends+=('llvm-libs-git')
        optdepends+=('clang-git: opencl' 'compiler-rt: opencl')
        ;;
    4)
        # extra/llvm
        makedepends+=(llvm=15.0.7 clang=15.0.7)
        depends+=(llvm-libs=15.0.7)
        optdepends+=('clang: opencl' 'compiler-rt: opencl')
        ;;
    *)
esac


prepare() {



    # although removing _build folder in build() function feels more natural,
    # that interferes with the spirit of makepkg --noextract
    if [  -d _build ]; then
        rm -rf _build
    fi

    local _patchfile
    for _patchfile in "${source[@]}"; do
        _patchfile="${_patchfile%%::*}"
        _patchfile="${_patchfile##*/}"
        [[ $_patchfile = *.patch ]] || continue
        echo "Applying patch $_patchfile..."
        patch --directory="mesa-${pkgver}" --forward --strip=1 --input="${srcdir}/${_patchfile}"
    done
}

build () {
    meson setup "mesa-${pkgver}" _build \
       -D b_ndebug=true \
       -D b_lto=false \
       -D platforms=x11,wayland \
       -D dri-drivers=pvr \
       -D gallium-drivers=swrast \
       -D vulkan-drivers=pvr \
       -D vulkan-layers=device-select,overlay \
       -D dri3=enabled \
       -D egl=enabled \
       -D gallium-extra-hud=true \
       -D gallium-opencl=disabled \
       -D gbm=enabled \
       -D gles1=disabled \
       -D gles2=enabled \
       -D glvnd=true \
       -D glx=dri \
       -D libunwind=enabled \
       -D llvm=enabled \
       -D lmsensors=enabled \
       -D osmesa=true \
       -D shared-glapi=enabled \
       -D microsoft-clc=disabled \
       -D valgrind=disabled \
       -D tools=[] \
       -D zstd=enabled \
       -D buildtype=plain \
       --wrap-mode=nofallback \
       -D prefix=/usr \
       -D sysconfdir=/etc
       
    meson configure --no-pager _build
    
    ninja $NINJAFLAGS -C _build
}

package() {
    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install

    # remove script file from /usr/bin
    # https://gitlab.freedesktop.org/mesa/mesa/issues/2230
    rm "${pkgdir}/usr/bin/mesa-overlay-control.py"
    rmdir "${pkgdir}/usr/bin"

    # indirect rendering
    ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"
  
}

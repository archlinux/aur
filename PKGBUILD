# Maintainer: Paul Sajna <hello@paulsajna.com>

pkgname=mesa-pvr-vf2
pkgdesc="an open-source implementation of the OpenGL specification, PowerVR (VisionFive2) version"
pkgver=22.1.7
pkgrel=4
arch=('riscv64')
makedepends=('git' 'python-mako' 'xorgproto'
              'libxml2' 'libx11'  'libvdpau' 'libva' 'elfutils' 'libxrandr'
              'wayland-protocols' 'meson' 'ninja' 'glslang' )
depends=('libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
         'libunwind' 'wayland' 'zstd' 'expat' 'libglvnd')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=('mesa' 'mesa-libgl' 'opengl-driver')
conflicts=('mesa' 'mesa-libgl')
url="https://www.mesa3d.org"
license=('custom')
source=("https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz"
'0001-Add-PVR-Gallium-driver.patch'
'0002-dri-Add-some-new-DRI-formats-and-fourccs.patch'
'0002-Force-Mesa-to-use-the-PVR-driver-for-platform-device.patch'
'0003-GL_EXT_sparse_texture-entry-points.patch'
'0004-Add-support-for-various-GLES-extensions.patch'
'0005-Add-EGL_IMG_cl_image-extension.patch'
'0006-egl-optimise-eglMakeCurrent-for-the-case-where-nothi.patch'
'0007-GL_EXT_shader_pixel_local_storage2-entry-points.patch'
'0008-GL_IMG_framebuffer_downsample-entry-points.patch'
'0009-GL_OVR_multiview-entry-points.patch'
'0010-Add-OVR_multiview_multisampled_render_to_texture.patch'
'0011-wayland-drm-install-wayland-drm.xml-to-the-configure.patch'
'0012-Enable-buffer-sharing-in-the-kms_swrast-driver.patch'
'0013-egl-wayland-add-support-for-RGB565-back-buffers.patch'
'0014-egl-automatically-call-eglReleaseThread-on-thread-te.patch'
'0015-egl-wayland-post-maximum-damage-when-blitting.patch'
'0016-egl-wayland-flush-the-drawable-before-blitting.patch'
'0017-dri-use-a-supported-API-in-driCreateNewContext.patch'
'0018-gbm-add-gbm_bo_blit.patch'
'0019-gbm-don-t-assert-if-DRI-context-creation-fails.patch'
'0020-egl-wayland-add-pbuffer-support.patch'
'0021-egl-eglBindAPI-workaround-for-dEQP-bug.patch'
'0022-GL_EXT_multi_draw_indirect-entry-points.patch'
'0023-dri-add-support-for-YUV-DRI-config.patch'
'0024-egl-add-support-for-EXT_yuv_surface.patch'
'0025-dri-add-missing-__DRI_IMAGE_COMPONENTS-define-for-EG.patch'
'0026-egl-wayland-expose-EXT_yuv_surface-support.patch'
'0027-gbm-add-some-new-GBM-formats.patch'
'0028-egl-add-null-platform.patch'
'0029-egl-add-support-for-EXT_image_gl_colorspace.patch'
'0030-meson-force-C-2011-for-thread_local.patch'
'0031-dri2-add-support-for-swap-intervals-other-than-1.patch'
'0032-null_platform-add-support-for-explicit-synchronisati.patch'
'0033-egl-null-add-support-for-DRM-image-format-modifiers.patch'
'0034-egl-query-the-supported-ES2-context-version.patch'
'0035-meson-allow-libGL-to-be-built-without-GLX.patch'
'0036-egl-wayland-process-non-resized-window-movement.patch'
'0037-Separate-EXT_framebuffer_object-from-ARB-version.patch'
'0038-egl-null-add-support-for-async-flip-with-front-buffe.patch'
'0039-gbm-add-pbuffer-support.patch'
'0040-egl-null-expose-EXT_yuv_surface-support.patch'
'0041-dri-preserve-the-original-FD-for-driver-use.patch'
'0042-egl-wayland-a-linear-buffer-is-not-needed-with-DRM-f.patch'
'0043-dri3-a-linear-buffer-is-not-needed-with-DRM-format-m.patch'
'0044-egl-drm-add-support-for-DRI_PRIME-GPU-selection.patch'
'0045-egl-null-add-support-for-DRI_PRIME-GPU-selection.patch'
'0046-egl-null-introduce-NULL_DRM_DISPLAY.patch'
'0047-vulkan-wsi-check-the-DRI3-and-Present-XCB-reply-poin.patch'
'0048-vulkan-wsi-make-the-display-FD-available.patch'
'0049-pvr-wsi-add-PowerVR-Vulkan-WSI-library.patch'
'0050-vulkan-wsi-Disable-use-of-VK_EXT_pci_bus_info.patch'
'0051-vulkan-wsi-default-to-force_bgra8_unorm_first-true.patch'
'0052-vulkan-wsi-enable-additional-formats-for-Display.patch'
'0053-mesa-partially-revert-pbuffer-attribute-removal.patch'
'0054-egl_dri2-set-pbuffer-config-attribs-to-0-for-non-pbu.patch'
'0055-GL_ARB_geometry_shader4-entry-points.patch'
'0056-egl-wayland-add-EGL_BUFFER_PRESERVED-support.patch'
'0057-glapi-restore-exec-dynamic.patch'
'0058-Revert-meson-check-mtls-if-has_exe_wrapper.patch'
'0059-gbm-add-GBM_FORMAT_AXBXGXRX106106106106.patch'
'0060-gallium-pvr-Add-DRM_FORMAT_AXBXGXRX106106106106.patch'
'0061-gallium-pvr-add-the-DRIconfigOptions-extension.patch'
'0062-gallium-pvr-support-DRI-Image-extension-v21.patch'
)

sha256sums=('da838eb2cf11d0e08d0e9944f6bd4d96987fdc59ea2856f8c70a31a82b355d89'
            '2ac349b1d799fab365aa419255fd34ab2e153e12c225e0baf628456cb13e172d'
            '891762286eea1e1b5dc65cec4908031218f2256302a8c3679cfc1a0756c01bfe'
            'b57b7baead401f0d0681249ddf4c2af98c2448c0fef307906f95fafcf4d6835f'
            '9f4e24feb159002d6f156e64727e22b444bf4a7703ce0efe703a90592a6ab0a7'
            'd7af5a52c9b50378b5ea883e9632511c525e951daf5fcd25a12d92ae2752b5a7'
            '1b3842f5ba95fd3510e90c092664e9fe7a467574cc6f0776abfea1f6656a3797'
            '4f92cd94c78b4fe2af9ae17f8eef43c87d6ce142e64d09678b02ec6c830a6a24'
            '40753683fee3b91b195291b338a5742b3cbdda94a4acdf4d8f7c246826940fda'
            '9b50a4e6571feedb7627772a5b6ff5a6600dfe9379aaabf7fda6c2842056ed26'
            '5b63a264743e3a6947bf2b35bcecbfb233558d3dbc41ca9de8a4c023fba7cf00'
            '56a1c6bab1bda2695177d393e9b8930c9348cf8c7abd2b4c4e7dae6687c1a74b'
            '9c8d30130e632731ef70fbf9d3afb5fb171660cae324ea49b991f970a9784a97'
            'dad5b61e66992ed7a4aa3382b78d00d5915d4f1bb47d303cba632609e6d40f36'
            '561232c8092fb1c00d63c58ce5ad1b5fa7f21bdf04b55d8b71f7e14222ff4db9'
            'bee04cfd0e8190971781a082effc99712f6742396528d0e9bb07758825caeeae'
            '90aff32aef6f4309e67a59ab194a517cce4cb1526b055ec617896826189749c0'
            '9fa79ab4a6e502af571f2017f6aec6f00b82b70093f0136d1a4cee2a7091932b'
            '0b3bbce24fb7150faed937d1bcd9777e8889cf815a7fc07f1c67a571e9b65c5d'
            '6235fe61c035170581b32a2ee23ce914f21c67c9e7a536555c02f9e5a73c7934'
            '8b16a60823263514a25dbfe2640d461c041587d3177396a0b35fef2fb3291a3f'
            '1a9e821939665355cb2bcefd8ff6a1c7e8598d59346228b2b1da804b5949369a'
            'f382ecad0bbb547904d59331b24fc5d7be19330f3510b4e1f7509dfb6c726f1c'
            'e46e190655ce7c06316842fe4a255c63891557c39536d9a85aa5c958cef5fc10'
            'ccc5f7c75ce685c82f78c090779098892f3dfc5c4968b4e94f22fb5faa0b644e'
            '7d3037ef3f9b4897accd9e418d05421d0595d98d0d6d588278d10c93463401f5'
            'c33e31707eff88c266e5f934def869fc351e745f30adc798ce4fc6d3a88420ba'
            '4f0a66f94877ab3778eb26960693df8270f8a299b066ef2134a389db70a74a98'
            '96e68ca052972e11cc707b74cea6b7864a1d87398fa1f0c3a1024d01b65bac57'
            'fc7f5856a0827d6dad95e42beb05c8b76973a021b34af11392446f84a0a2029e'
            '36526f789f81b8fb3437a918d432b82941d66305338ed2989a9447cdd8e7ec79'
            '8efea8ca3842d351c9e0a345f13597d8ae0a8ff7a9163125f67af4c04fb94530'
            '1d29dc4716bbe5d162270c0517f5dcf2589c4b0e74766a78374a85c5cec20543'
            '12b971fab9c64ecb10a937631473408edfa19c13da4b7024f93662a546d1a2e9'
            '1f8a18129440487622851ecc7fff411d496dedb46b430bdc4d1ef30a5edd87d3'
            'd20b81f32f145bb1fb859e64fc9e329361f4b09845212a60b9f8fb42063d7137'
            'b4745dee49d615e2224cddc17bd44173703de117b6de5953b8a9ac7586ddda80'
            '123e44e3693ea7590f5a4eda647a30b07ef7e91dd4e937cfbaac3f8c250c68b7'
            '363f7d5515e2533f3b2473e649e4df71ce091b7a7a7210dc88816720fcd0a11f'
            'df18dc94665c3c76115366287100237e289eab44f6ea98190af021192112daa1'
            '109b46637798e599149ca88084b3c7430297a0bf1908099cd42cb0a24261d97f'
            'afd54d74b7e6396c9b90bbe94d836846afa8242559c204a936149f881e56587c'
            'b7b9773c7b1b5569d46ae29fbb100a6c8db643f9dfb0ea2384e4be43f4f5c4bd'
            'b1c030cd96a65dcf8743eb06d3d2fd3a5a9c79d1f1c72358ad4bf96ca424de23'
            '33e02928156a19259007a08f270af10defa82427cfb8c9116131a7262e652f6c'
            'e61142363e83064d77599d23257e75ad8bca8e4981824641219bdd91bed17674'
            'a6878c0b986cd54b0dea517f4e0a3ce6297123d8436da6f99d6e861ff00a154c'
            '03dca4749641e7efa9c725cdcb91804d02bf0b0f7d987d4f12105b5b01cc5677'
            'c886bf99652eb7ed0d5db885a789f4c96a6f8ddca2d5b1ef31c6f6fe6b9edda8'
            '524179fa0098262b0afd9ff5153e96ce61d06f7b99ea1f9c0ab11ab19ab71134'
            'a2ab2bf83620d586e3b4a41f3f17223522a7315eb4c348ee1c8d48cdd32b9cda'
            '50496a24dd4a0253c455429dfae7979345d3435540b1f89e10f1e7191027146e'
            '8f73d2b3467c60340a85e1d805a294d3eab240b2c6e24817140eac9e03792b43'
            '060366bd2f24a893e9491c2ed608fa1038af3ca3db09e1387f9c75eafb6936be'
            '7b4fb22029d1e25c4f7b5ff1ddb86532f7ff025db4727bb8f31b30677752993d'
            'dd59c855107b4db6c6d96c96623eb3ec16b0358a6344a28f6bcb1d8363c3b6ad'
            '81127b6c8e95145b8d0307568bb6125f7eca42e79abf4b49a059b18ab8cf53e4'
            '166503de18aafe4877fd26947704b5a18d58a6d14416d36f80054480a20fadcf'
            '33df64c2013234f31cabe8c79f9aebff7c73aa52460bf497b1e114c828fc1ab2'
            'c15e38e1b9b90cc8af5e388d31f44c822906c6c4e4ec907ec9252e4352512d87'
            'ac5b60aac8abdb7620c859bfbb609fe28c7aca46b5f08b91066e63f85a3192f2'
            '4c71d7c43d4dccd34335099b370460920435999dbc44d858fdd89f83fe61ca14'
            '7b27f03f37e62326bee2bf96efbeea58e57f8d851608dfe1a5a0d6c528b8cd46'
            '05ffe42a8686b3bf28b157b655adc0015aedd74a2a676f2b05e38feaab0863e6')

prepare() {



    # although removing _build folder in build() function feels more natural,
    # that interferes with the spirit of makepkg --noextract
    if [  -d _build ]; then
        rm -rf _build
    fi

    sed -i 's/\r$//' ${srcdir}/mesa-${pkgver}/src/mesa/main/formats.csv;

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
       -Dshared-glapi=enabled \
       -Dglx-read-only-text=true \
       -Dplatforms='wayland,x11' \
       -Dgles1=disabled \
       -Dgles2=enabled \
       -Ddri3=disabled \
       -Degl=enabled \
       -Dgallium-drivers=swrast,pvr \
       -Dllvm=disabled \
       -Dgbm=enabled \
       -Dlmsensors=disabled \
       -Dgallium-opencl=disabled \
       -Dopencl-spirv=false \
       -Dopengl=true \
       -Dosmesa=false \
       -Dperfetto=false \
       -Dlibunwind=disabled \
       -Dgallium-va=disabled \
       -Dgallium-vdpau=disabled \
       -Dvulkan-drivers='' \
       -Dgallium-xa=disabled \
       -Dgallium-xvmc=disabled \
       -Dglvnd=true \
       -D prefix=/usr \
       -D sysconfdir=/etc \
       
    meson configure --no-pager _build
    
    ninja $NINJAFLAGS -C _build
}

package() {
    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install

    # indirect rendering
    ln -s "${pkgdir}/usr/lib/libGLX_mesa.so.0" "${pkgdir}/usr/lib/libGLX_indirect.so.0"
  
}

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=timedoctorpro
pkgver=1.4.75.14
urlver=$(echo $pkgver|sed 's/\.\([^.]*\)$/-\1/')
pkgrel=4
arch=('x86_64')
pkgdesc="App to track work time from timedoctor.com"
url="https://www.timedoctor.com/download.html"
license=('proprietary')

#maybe also depends=('libxss')
depends=('libx11' 'libxcb' 'zlib' 'qt4' 'opencv' 'jasper')

source=(
    "https://updates.timedoctor.com/download/_production/tdpro/linux-ubuntu-16.04/timedoctorpro_${urlver}ubuntu16.04_amd64.deb"
    "https://archive.archlinux.org/packages/j/jasper/jasper-1.900.5-1-x86_64.pkg.tar.xz"
)
md5sums=(
    "0d50154852f5f10bd8e470066f61a523"
    "c8360ae58c424f1c1d4cff50d56e47ec"
)

package() {
        cd $pkgdir
        tar -xf $srcdir/data.tar.xz
        cp $srcdir/usr/lib/libjasper.so.1.0.0 opt/timedoctorpro/libjasper.so.1

        #package opencv2 conflicts with opencv, timedoctor works with opencv v3.2 but needs symlinks
        mkdir usr/lib
        cd usr/lib
        ln -s libopencv_aruco.so.3.2 libopencv_aruco.so.2.4
        ln -s libopencv_bgsegm.so.3.2 libopencv_bgsegm.so.2.4
        ln -s libopencv_bioinspired.so.3.2 libopencv_bioinspired.so.2.4
        ln -s libopencv_calib3d.so.3.2 libopencv_calib3d.so.2.4
        ln -s libopencv_ccalib.so.3.2 libopencv_ccalib.so.2.4
        ln -s libopencv_core.so.3.2 libopencv_core.so.2.4
        ln -s libopencv_datasets.so.3.2 libopencv_datasets.so.2.4
        ln -s libopencv_dnn.so.3.2 libopencv_dnn.so.2.4
        ln -s libopencv_dpm.so.3.2 libopencv_dpm.so.2.4
        ln -s libopencv_face.so.3.2 libopencv_face.so.2.4
        ln -s libopencv_features2d.so.3.2 libopencv_features2d.so.2.4
        ln -s libopencv_flann.so.3.2 libopencv_flann.so.2.4
        ln -s libopencv_freetype.so.3.2 libopencv_freetype.so.2.4
        ln -s libopencv_fuzzy.so.3.2 libopencv_fuzzy.so.2.4
        ln -s libopencv_hdf.so.3.2 libopencv_hdf.so.2.4
        ln -s libopencv_highgui.so.3.2 libopencv_highgui.so.2.4
        ln -s libopencv_imgcodecs.so.3.2 libopencv_imgcodecs.so.2.4
        ln -s libopencv_imgproc.so.3.2 libopencv_imgproc.so.2.4
        ln -s libopencv_line_descriptor.so.3.2 libopencv_line_descriptor.so.2.4
        ln -s libopencv_ml.so.3.2 libopencv_ml.so.2.4
        ln -s libopencv_objdetect.so.3.2 libopencv_objdetect.so.2.4
        ln -s libopencv_optflow.so.3.2 libopencv_optflow.so.2.4
        ln -s libopencv_phase_unwrapping.so.3.2 libopencv_phase_unwrapping.so.2.4
        ln -s libopencv_photo.so.3.2 libopencv_photo.so.2.4
        ln -s libopencv_plot.so.3.2 libopencv_plot.so.2.4
        ln -s libopencv_reg.so.3.2 libopencv_reg.so.2.4
        ln -s libopencv_rgbd.so.3.2 libopencv_rgbd.so.2.4
        ln -s libopencv_saliency.so.3.2 libopencv_saliency.so.2.4
        ln -s libopencv_shape.so.3.2 libopencv_shape.so.2.4
        ln -s libopencv_stereo.so.3.2 libopencv_stereo.so.2.4
        ln -s libopencv_stitching.so.3.2 libopencv_stitching.so.2.4
        ln -s libopencv_structured_light.so.3.2 libopencv_structured_light.so.2.4
        ln -s libopencv_superres.so.3.2 libopencv_superres.so.2.4
        ln -s libopencv_surface_matching.so.3.2 libopencv_surface_matching.so.2.4
        ln -s libopencv_text.so.3.2 libopencv_text.so.2.4
        ln -s libopencv_tracking.so.3.2 libopencv_tracking.so.2.4
        ln -s libopencv_videoio.so.3.2 libopencv_videoio.so.2.4
        ln -s libopencv_video.so.3.2 libopencv_video.so.2.4
        ln -s libopencv_videostab.so.3.2 libopencv_videostab.so.2.4
        ln -s libopencv_xfeatures2d.so.3.2 libopencv_xfeatures2d.so.2.4
        ln -s libopencv_ximgproc.so.3.2 libopencv_ximgproc.so.2.4
        ln -s libopencv_xobjdetect.so.3.2 libopencv_xobjdetect.so.2.4
        ln -s libopencv_xphoto.so.3.2 libopencv_xphoto.so.2.4

}

# Maintainer: Robert Pannick <rwpannick@gmail.com>
# Contributor: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=sparta-plugins
pkgver=2022_06_20_v1.6.2
pkgrel=1
pkgdesc='AALTO vst plugins for Spatial Audio Real-time Applications'
arch=('x86_64' 'x86_64_v3')
url="http://research.spa.aalto.fi/projects/sparta_vsts/"
license=('GPL')
groups=('pro-audio')
depends=('bubblewrap' 'webkit2gtk')
provides=('sparta-plugins')
source=("https://github.com/leomccormack/SPARTA/releases/download/v1.6.2/Linux_SPARTA_$pkgver.zip")
sha256sums=('1b8789a8a47e11379283d953db2ed6640b0bb84874032b795b1bd5d1e017ace5')

package() {
	cd "$srcdir/Linux_SPARTA_$pkgver"

  #TODO: remove faulty plugins

	# Custom mkl and ipp lib needed for the installation
	install -Dm755 "libsaf_mkl_custom_lp64.so" "$pkgdir/usr/lib/libsaf_mkl_custom_lp64.so"
	install -Dm755 "libsaf_ipp_custom.so" "$pkgdir/usr/lib/libsaf_ipp_custom.so"

	# Install compass plugins
	install -Dm755 "libcompass_6DoF.so" "$pkgdir/usr/lib/vst/libcompass_6DoF.so"
	install -Dm755 "libcompass_array2sh.so" "$pkgdir/usr/lib/vst/libcompass_array2sh.so"
	install -Dm755 "libcompass_binaural.so" "$pkgdir/usr/lib/vst/libcompass_binaural.so"
	install -Dm755 "libcompass_binauralVR.so" "$pkgdir/usr/lib/vst/binauralVR.so"
	install -Dm755 "libcompass_decoder.so" "$pkgdir/usr/lib/vst/libcompass_decoder.so"
	install -Dm755 "libcompass_gravitator.so" "$pkgdir/usr/lib/vst/libcompass_gravitator.so"
	install -Dm755 "libcompass_sidechain.so" "$pkgdir/usr/lib/vst/libcompass_sidechain.so"
	install -Dm755 "libcompass_spatedit.so" "$pkgdir/usr/lib/vst/libcompass_spatedit.so"
	install -Dm755 "libcompass_tracker.so" "$pkgdir/usr/lib/vst/libcompass_tracker.so"
	install -Dm755 "libcompass_upmixer.so" "$pkgdir/usr/lib/vst/libcompass_upmixer.so"

	# Install cropac
	install -Dm755 "libcropac_binaural.so" "$pkgdir/usr/lib/vst/libcropac_binaural.so"

	# Install hades
	install -Dm755 "libhades_renderer.so" "$pkgdir/usr/lib/vst/libhades_renderer.so"

	# Install sparta plugins
	install -Dm755  "libsparta_6DoFconv.so" "$pkgdir/usr/lib/vst/libsparta_6DoFconv.so"
	install -Dm755  "libsparta_ambiBIN.so" "$pkgdir/usr/lib/vst/libsparta_ambiBIN.so"
	install -Dm755  "libsparta_ambiDEC.so" "$pkgdir/usr/lib/vst/libsparta_ambiDEC.so"
	install -Dm755  "libsparta_ambiDRC.so" "$pkgdir/usr/lib/vst/libsparta_ambiDRC.so"
	install -Dm755  "libsparta_ambiENC.so" "$pkgdir/usr/lib/vst/libsparta_ambiENC.so"
	install -Dm755  "libsparta_ambiRoomSim.so" "$pkgdir/usr/lib/vst/libsparta_ambiRoomSim.so"
	install -Dm755  "libsparta_array2sh.so" "$pkgdir/usr/lib/vst/libsparta_array2sh.so"
	install -Dm755  "libsparta_beamformer.so" "$pkgdir/usr/lib/vst/libsparta_beamformer.so"
	install -Dm755  "libsparta_binauraliser.so" "$pkgdir/usr/lib/vst/libsparta_binauraliser.so"
	install -Dm755  "libsparta_binauraliser_nf.so" "$pkgdir/usr/lib/vst/libsparta_binauraliser_nf.so"
	install -Dm755  "libsparta_decorrelator.so" "$pkgdir/usr/lib/vst/libsparta_decorrelator.so"
	install -Dm755  "libsparta_matrixconv.so" "$pkgdir/usr/lib/vst/libsparta_matrixconv.so"
	install -Dm755  "libsparta_multiconv.so" "$pkgdir/usr/lib/vst/libsparta_multiconv.so"
	install -Dm755  "libsparta_panner.so" "$pkgdir/usr/lib/vst/libsparta_panner.so"
	install -Dm755  "libsparta_pitchShifter.so" "$pkgdir/usr/lib/vst/libsparta_pitchShifter.so"
	install -Dm755  "libsparta_rotator.so" "$pkgdir/usr/lib/vst/libsparta_rotator.so"
	install -Dm755  "libsparta_spreader.so" "$pkgdir/usr/lib/vst/libsparta_spreader.so"

	# Install HOSIRR
	install -Dm755 "libHOSIRR.so" "$pkgdir/usr/lib/vst/libHOSIRR.so"

	# Install HODIRAC
	install -Dm755 "libhodirac_binaural.so" "$pkgdir/usr/lib/vst/libhodirac_binaural.so"

	# Install Ultra Sonic Super Hearing
	install -Dm755  "libUltrasonicSuperHearing.so" "$pkgdir/usr/lib/vst/libUltrasonicSuperHearing.so"

}

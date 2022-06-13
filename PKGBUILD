# Maintainer: Michal Donat <michal at donat dot cz>

pkgname=ca-certificates-postsignum
pkgver=20220606
pkgrel=1
pkgdesc="PostSignum root & qualified certificates"
arch=(any)
url="http://www.postsignum.cz/"
license=('unknown')
depends=('ca-certificates-utils')
install='ca-certificates-postsignum.install'

source=(
	# PostSignum Root QCA 4 
	'http://crl.postsignum.eu/files/ca/postsignum_qca4_root.pem' # EXP 26.7.2038
	'http://crl.postsignum.eu/files/ca/postsignum_qca4_sub.pem' # EXP 27.9.2033
	'http://crl.postsignum.eu/files/ca/postsignum_qca5_sub.pem' # EXP 3.10.2033
	'http://crl.postsignum.eu/files/ca/postsignum_vca4_sub.pem' # EXP 27.9.2033
	'http://crl.postsignum.eu/files/ca/postsignum_vca5_sub.pem' # EXP 3.10.2033

	# PostSignum Root QCA 2
	'http://crl.postsignum.eu/files/ca/postsignum_qca2_root.pem' # EXP 19.1.2025
	#'http://crl.postsignum.eu/files/ca/postsignum_qca2_sub.pem' # EXP 19.1.2020
	'http://crl.postsignum.eu/files/ca/postsignum_qca3_sub.pem'  # EXP 26.3.2024, Provoz certifikační autority byl ukončen
	'http://crl.postsignum.eu/files/ca/postsignum_qca3_sub-tsa.pem' # EXP 19.1.2025, Provoz certifikační autority byl ukončen
	#'http://crl.postsignum.eu/files/ca/postsignum_vca2_sub.pem'  # EXP 19.1.2020
	'http://crl.postsignum.eu/files/ca/postsignum_vca3_sub.pem' # EXP 19.1.2025
	)

sha256sums=(
	# PostSignum Root QCA 4 
	'E94ECB15810EC55A6522F83D8B6519CDB6EE820A40BEAE8220206B46367A513E' # postsignum_qca4_root.pem
	'37B3BF7D089CCD761B4068742813525499FD35B1420D54446CD1F90E2AEDD574' # postsignum_qca4_sub.pem
	'2048086FCA03EFE8BA9FDF34E469B002CA6180205874F7384FD9D928F0FD86A5' # postsignum_qca5_sub.pem
	'BE7F90732ECD73ED36706C7C2249C42C421754802719A8F432299CA2A8C32D08' # postsignum_vca4_sub.pem
	'D9F009B2F96EB6BC50B2AEA9195FE91F59816AC46010DFF46AD3CD0E4DC9D6F9' # postsignum_vca5_sub.pem

	# PostSignum Root QCA 2
	'952729291C6D55EF53E7B6EE220704F1F400561ED8B7A6DE047A29C11E27E0C2' # postsignum_qca2_root.pem
	#'991978CB1832BF67B2E15E7108CD0A4112EEC8AA7E150BA9897F0D8311B77EEC' # postsignum_qca2_sub.pem
	'04CB2E112E00C0CA1F353BC7C23B19DF4D16B9624E1863600B933E00A71DB81E' # postsignum_qca3_sub.pem
	'2F37913181587CB113ABD6A4EB24BC0BC0BD10080BA7B647F082B3D86B55CBFA' # postsignum_qca3_sub-tsa.pem
	#'3A79DB26D6C9BDC19478585F4B8AB659B8E0A4E354136E4C118C796685F21F09' # postsignum_vca2_sub.pem
	'674DA249BD9B1EA02EB63B113BD7792D84E5A79E17A7461863282506F5B0B32E' # postsignum_vca3_sub.pem
	)

package() {
  for cert in *.pem; do
  	install -Dm644 "${cert}" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/${cert}"
  done
}

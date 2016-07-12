# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgbase='strongswan-devel'
pkgname=('strongswan-devel'
         'perl-vici-devel'
         'python-vici-devel'
         'python2-vici-devel'
         'ruby-vici-devel')
pkgver=5.5.0rc1
pkgrel=1

arch=('i686' 'x86_64')
license=('GPL' 'MIT')
pkgdesc='Open source IKEv1/IKEv2 IPSec implementation'
url='http://www.strongswan.org'

makedepends=('doxygen' 'gperf' 'systemd' 'unbound' 'pcsclite' 'libmariadbclient'
             'libnm-glib' 'python-setuptools' 'python2-setuptools' 'ruby')
sha256sums=('6edcce6c97ad5292b17ed010c80d9729c337662b41b8365981c2505cd242b98e'
            'SKIP'
            '59b410cf04e7ff599a097c8f2f291f4cc836e5cb28ecce98df45a41f61a516d6')
source=("https://download.strongswan.org/strongswan-$pkgver.tar.bz2"
        "https://download.strongswan.org/strongswan-$pkgver.tar.bz2.sig"
        'strongswan.tmpfiles')
validpgpkeys=('948F158A4E76A27BF3D07532DF42C170B34DBA77')

_configure_args=(
	### BUILD CONTROL (Don't change these unless you know what you're doing!)
	#--enable-all                   # enable all plugins and features (they can be with their respective --disable options)
	#--disable-defaults             # disable all default plugins (they can be enabled their respective --enable options)
	#--enable-monolithic            # build monolithic versions of libraries with all enabled plugins
	#--disable-option-checking      # ignore unrecognized --enable/--with options
	--enable-silent-rules           # less verbose build output
	--disable-static                # don't build static libraries (speeds up build)

	### DIRECTORIES (Don't change these either!)
	--prefix=/usr                                # base system install directory
	--sbindir=/usr/bin                           # system administrator executables
	--libexecdir=/usr/lib                        # internal program executables
	--sysconfdir=/etc                            # read-only machine-specific configuration data
	--sharedstatedir=/var                        # modifiable architecture-independent data
	--localstatedir=/var                         # modifiable single-machine data
	--with-piddir=/run/strongswan                # runtime PID and socket files
	--with-swanctldir=/etc/strongswan.d/swanctl  # swanctl configuration and credentials

	### DEFAULT FEATURES
	#--disable-aes                  # disable internal AES crypto plugin.
	#--disable-attr                 # disable strongswan.conf based configuration plugin.
	--disable-charon                # disable the IKEv1/IKEv2 keying daemon charon (stroke/starter version)
	#--disable-cmac                 # disable internal CMAC crypto plugin.
	#--disable-constraints          # disable advanced X509 constraint checking plugin.
	#--disable-des                  # disable internal DES/3DES crypto plugin.
	#--disable-dnskey               # disable DNS RR key decoding plugin.
	#--disable-fips-prf             # disable internal FIPS PRF crypto plugin.
	#--disable-gmp                  # disable GNU MP (libgmp) based crypto implementation
	#--disable-hmac                 # disable internal HMAC crypto plugin.
	#--disable-ikev1                # disable IKEv1 protocol support in libcharon.
	#--disable-ikev2                # disable IKEv2 protocol support in libcharon.
	#--disable-kernel-netlink       # disable the netlink kernel interface.
	#--disable-load-warning         # disable the charon plugin load option warning.
	#--disable-md5                  # disable internal MD5 crypto plugin.
	#--disable-nonce                # disable nonce generation plugin.
	#--disable-pem                  # disable PEM decoding plugin.
	#--disable-pgp                  # disable PGP key decoding plugin.
	#--disable-pkcs1                # disable PKCS1 key decoding plugin.
	#--disable-pkcs12               # disable PKCS12 container support plugin.
	#--disable-pkcs7                # disable PKCS7 container support plugin.
	#--disable-pkcs8                # disable PKCS8 private key decoding plugin.
	#--disable-pki                  # disable pki certificate utility.
	#--disable-pubkey               # disable RAW public key support plugin.
	#--disable-random               # disable RNG implementation on top of /dev/(u)random.
	#--disable-rc2                  # disable internal RC2 crypto plugin.
	#--disable-resolve              # disable resolve DNS handler plugin.
	#--disable-revocation           # disable X509 CRL/OCSP revocation check plugin.
	--disable-scepclient            # disable Cisco SCEP client tool.
	#--disable-scripts              # disable additional utilities (found in directory scripts).
	#--disable-sha1                 # disable internal SHA1 crypto plugin.
	#--disable-sha2                 # disable internal SHA256/SHA384/SHA512 crypto plugin.
	#--disable-socket-default       # disable default socket implementation for charon.
	#--disable-sshkey               # disable SSH key decoding plugin.
	--disable-stroke                # disable charon's stroke configuration backend.
	#--disable-swanctl              # disable swanctl configuration and control tool.
	#--disable-updown               # disable updown firewall script plugin.
	#--disable-vici                 # disable strongSwan IKE generic IPC interface plugin.
	#--disable-x509                 # disable X509 certificate implementation plugin.
	#--disable-xauth-generic        # disable generic XAuth backend.
	#--disable-xcbc                 # disable internal XCBC crypto plugin.

	### OPTIONAL FEATURES
	#--enable-acert                 # enable X509 attribute certificate checking plugin.
	#--enable-addrblock             # enable RFC 3779 address block constraint support.
	--enable-aesni                  # enable Intel AES-NI crypto plugin.
	--enable-af-alg                 # enable AF_ALG crypto interface to Linux Crypto API.
	--enable-agent                  # enable the ssh-agent signing plugin.
	#--enable-aikgen                # enable AIK generator.
	--enable-attr-sql               # enable SQL based configuration attribute plugin.
	#--enable-bfd-backtraces        # use binutils libbfd to resolve backtraces for memory leaks and segfaults.
	--enable-bliss                  # enable internal BLISS/BLISS-B crypto plugin (post-quantum).
	--enable-blowfish               # enable internal Blowfish crypto plugin.
	--enable-ccm                    # enable internal CCM AEAD wrapper crypto plugin.
	#--enable-certexpire            # enable CSV export of expiration dates of used certificates.
	--enable-chapoly                # enable internal ChaCha20/Poly1305 AEAD crypto plugin.
	--enable-cmd                    # enable the command line IKE client charon-cmd.
	#--enable-conftest              # enforce Suite B conformance test framework.
	--enable-connmark               # enable connmark plugin using conntrack based marks to select return path SA.
	#--enable-coupling              # enable IKEv2 plugin to couple peer certificates to authentication.
	#--enable-coverage              # enable lcov coverage report generation.
	--enable-ctr                    # enable internal Counter Mode wrapper crypto plugin.
	--enable-curl                   # enable CURL fetcher plugin to fetch files via libcurl.
	--enable-dhcp                   # enable DHCP based attribute provider plugin.
	--enable-dnscert                # enable DNSCERT authentication plugin.
	#--enable-dumm                  # enable the DUMM UML test framework.
	--enable-duplicheck             # enable advanced duplicate checking plugin using liveness checks.
	--enable-eap-aka                # enable EAP AKA authentication module.
	--enable-eap-aka-3gpp2          # enable EAP AKA backend implementing 3GPP2 algorithms using libgmp.
	--enable-eap-dynamic            # enable dynamic EAP proxy module.
	--enable-eap-gtc                # enable EAP GTC authentication module.
	--enable-eap-identity           # enable EAP module providing EAP-Identity helper.
	--enable-eap-md5                # enable EAP MD5 (CHAP) authentication module.
	--enable-eap-mschapv2           # enable EAP MS-CHAPv2 authentication module.
	--enable-eap-peap               # enable EAP PEAP authentication module.
	--enable-eap-radius             # enable RADIUS proxy authentication module.
	--enable-eap-sim                # enable SIM authentication module for EAP.
	--enable-eap-sim-file           # enable EAP-SIM backend based on a triplet file.
	--enable-eap-sim-pcsc           # enable EAP-SIM backend based on a smartcard reader. libpcsclite.
	--enable-eap-simaka-pseudonym   # enable EAP-SIM/AKA pseudonym storage plugin.
	--enable-eap-simaka-reauth      # enable EAP-SIM/AKA reauthentication data storage plugin.
	--enable-eap-simaka-sql         # enable EAP-SIM/AKA backend based on a triplet/quintuplet SQL database.
	--enable-eap-tls                # enable EAP TLS authentication module.
	#--enable-eap-tnc               # enable EAP TNC trusted network connect module.
	--enable-eap-ttls               # enable EAP TTLS authentication module.
	--enable-error-notify           # enable error notification plugin.
	--enable-ext-auth               # enable plugin calling an external authorization script.
	--enable-farp                   # enable ARP faking plugin that responds to ARP requests to peers' virtual IPs.
	#--enable-fast                  # enable libfast (FastCGI Application Server w/templates).
	--enable-files                  # enable simple file:// URI fetcher.
	--enable-forecast               # enable forecast plugin forwarding messages.
	--enable-gcm                    # enable internal GCM AEAD wrapper crypto plugin.
	--enable-gcrypt                 # enable libgcrypt based crypto plugin.
	--enable-ha                     # enable high availability cluster plugin.
	#--enable-imc-attestation       # enable IMC attestation module.
	#--enable-imc-hcd               # enable IMC hcd module.
	#--enable-imc-os                # enable IMC operating system module.
	#--enable-imc-scanner           # enable IMC port scanner module.
	#--enable-imc-swid              # enable IMC swid module.
	#--enable-imc-test              # enable IMC test module.
	#--enable-imv-attestation       # enable IMV attestation module.
	#--enable-imv-hcd               # enable IMV hcd module.
	#--enable-imv-os                # enable IMV operating system module.
	#--enable-imv-scanner           # enable IMV port scanner module.
	#--enable-imv-swid              # enable IMV swid module.
	#--enable-imv-test              # enable IMV test module.
	#--enable-integrity-test        # enable integrity testing of libstrongswan and plugins (conflicts with strip/prelink).
	--enable-ipseckey               # enable IPSECKEY authentication plugin.
	#--enable-kernel-libipsec       # enable the libipsec "kernel" interface.
	--enable-ldap                   # enable LDAP fetching plugin to fetch files via libldap.
	#--enable-leak-detective        # enable malloc hooks to find memory leaks.
	--enable-led                    # enable plugin to control LEDs on IKEv2 activity using the Linux kernel LED subsystem.
	#--enable-libipsec              # enable user space IPsec implementation.
	#--enable-load-tester           # enable load testing plugin for IKEv2 daemon.
	#--enable-lock-profiler         # enable lock/mutex profiling code.
	--enable-log-thread-ids         # use thread ID instead of counter to log threads (when available).
	--enable-lookip                 # enable fast virtual IP lookup and notification plugin.
	#--enable-manager               # enable web management console (proof of concept).
	--enable-md4                    # enable internal MD4 crypto plugin.
	#--enable-medcli                # enable mediation client configuration database plugin.
	#--enable-mediation             # enable IKEv2 Mediation Extension.
	#--enable-medsrv                # enable mediation server web frontend and daemon plugin.
	--enable-mysql                  # enable MySQL database support via libmysqlclient_r.
	--enable-nm                     # enable NetworkManager backend.
	--enable-ntru                   # enable internal NTRU crypto plugin (post-quantum).
	--enable-openssl                # enable OpenSSL based crypto plugin.
	--enable-p-cscf                 # enable plugin to request P-CSCF server addresses from an ePDG.
	#--enable-padlock               # enable VIA Padlock crypto plugin.
	--enable-pkcs11                 # enable PKCS11 token support plugin.
	--enable-radattr                # enable plugin to inject and process custom RADIUS attributes as IKEv2 client.
	--enable-rdrand                 # enable Intel RDRAND random generator plugin.
	--enable-sha3                   # enable internal SHA3_224/SHA3_256/SHA3_384/SHA3_512 crypto plugin.
	#--enable-smp                   # enable SMP configuration and control interface (requires libxml).
	--enable-socket-dynamic         # enable dynamic socket implementation for charon.
	#--enable-soup                  # enable soup fetcher plugin to fetch from HTTP via libsoup.
	--enable-sql                    # enable SQL database configuration backend.
	--enable-sqlite                 # enable SQLite database support (requires libsqlite3).
	--enable-systemd                # enable systemd specific IKE daemon charon-systemd.
	#--enable-systime-fix           # enable plugin to handle invalid system time gracefully.
	--enable-test-vectors           # enable plugin providing crypto test vectors.
	#--enable-tkm                   # enable Trusted Key Manager support.
	#--enable-tnc-ifmap             # enable TNC IF-MAP module.
	#--enable-tnc-imc               # enable TNC IMC module.
	#--enable-tnc-imv               # enable TNC IMV module.
	#--enable-tnc-pdp               # enable TNC policy decision point module.
	#--enable-tnccs-11              # enable TNCCS 1.1 protocol module.
	#--enable-tnccs-20              # enable TNCCS 2.0 protocol module.
	#--enable-tnccs-dynamic         # enable dynamic TNCCS protocol discovery module.
	#--enable-uci                   # enable OpenWRT UCI configuration plugin.
	--enable-unbound                # enable UNBOUND resolver plugin to perform DNS queries via libldns/libunbound.
	--enable-unity                  # enable Cisco Unity extension plugin.
	#--enable-unwind-backtraces     # use libunwind to create backtraces for memory leaks and segfaults.
	#--enable-whitelist             # enable peer identity whitelisting plugin.
	--enable-xauth-eap              # enable XAuth backend using EAP methods to verify passwords.
	--enable-xauth-noauth           # enable XAuth pseudo-backend that does not verify/request passwords.
	--enable-xauth-pam              # enable XAuth backend using PAM to verify passwords.

	### OPTIONAL PACKAGES
	--with-capabilities=native                   # enable capability dropping with native Linux capset interface.
	#--with-dev-headers=/usr/include/strongswan  # install strongSwan development headers.
	#--with-random-device=/dev/random            # the device to read real random data from.
)

build() {
	cd "strongswan-${pkgver}"
	./configure -C "${_configure_args[@]}"
	make
}

package_strongswan-devel() {
	arch=('i686' 'x86_64')
	license=('GPL')
	pkgdesc='Open source IKEv1/IKEv2 IPSec implementation'
	url='http://www.strongswan.org'

	backup=(etc/strongswan{.conf,.d/{pki,pool,swanctl{,/swanctl}}.conf})
	conflicts=('openswan' 'libreswan' 'strongswan' 'ipsec-tools')
	provides=('strongswan')

	depends=('systemd' 'iproute2')
	optdepends=('networkmanager-strongswan: for NetworkManager integration'
	            'unbound: unbound plugin (DNSSEC-enabled resolver)'
	            'pcsclite: eap-sim-pcsc plugin (EAP-SIM PC/SC smartcard backend)'
	            'libmariadbclient: mysql plugin (MySQL database support)'
	            'curl: curl plugin (for fetching CRLs via libcurl)'
	            'sqlite: sqlite plugin (SQLite3 database support)')

	cd "strongswan-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -Dm644 "${srcdir}/strongswan.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/strongswan.conf"
}

package_perl-vici-devel() {
	arch=('any')
	license=('MIT')
	pkgdesc='Perl bindings for the strongSwan Versatile IKE Configuration Interface'
	url='https://wiki.strongswan.org/projects/strongswan/wiki/VICI'

	conflicts=('perl-vici' 'perl-vici-session')
	provides=('perl-vici' 'perl-vici-session')

	depends=('perl')

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'

	cd "strongswan-${pkgver}"
	./configure -C "${_configure_args[@]}" --enable-perl-cpan --enable-perl-cpan-install

	cd src/libcharon/plugins/vici/perl
	make INSTALLDIRS=vendor DESTDIR="${pkgdir}" install

	sed --silent '/^=head1 COPYRIGHT AND LICENSE$/,$'p ./Vici-Session/README.pod | tail --lines=+3 > LICENSE
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-vici-devel() {
	arch=('any')
	license=('MIT')
	pkgdesc='Python bindings for the strongSwan Versatile IKE Configuration Interface'
	url='https://wiki.strongswan.org/projects/strongswan/wiki/VICI'

	conflicts=('python-vici')
	provides=('python-vici')

	depends=('python')

	PYTHON="/usr/bin/python3"

	cd "strongswan-${pkgver}"
	./configure -C "${_configure_args[@]}" --enable-python-eggs --enable-python-eggs-install

	cd src/libcharon/plugins/vici/python
	make && $PYTHON setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-vici-devel() {
	arch=('any')
	license=('MIT')
	pkgdesc='Python 2 bindings for the strongSwan Versatile IKE Configuration Interface'
	url='https://wiki.strongswan.org/projects/strongswan/wiki/VICI'

	conflicts=('python2-vici')
	provides=('python2-vici')

	depends=('python2')

	PYTHON="/usr/bin/python2"

	cd "strongswan-${pkgver}"
	./configure -C "${_configure_args[@]}" --enable-python-eggs --enable-python-eggs-install

	cd src/libcharon/plugins/vici/python
	make && $PYTHON setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ruby-vici-devel() {
	arch=('any')
	license=('MIT')
	pkgdesc='Ruby bindings for the strongSwan Versatile IKE Configuration Interface'
	url='https://wiki.strongswan.org/projects/strongswan/wiki/VICI'

	conflicts=('ruby-vici')
	provides=('ruby-vici')

	depends=('ruby')

	cd "strongswan-${pkgver}"
	./configure -C "${_configure_args[@]}" --enable-ruby-gems --enable-ruby-gems-install

	cd src/libcharon/plugins/vici/ruby
	make DESTDIR="${pkgdir}" install

	cd lib
	sed -n '2,/^$/p' vici.rb | colrm 1 2 > LICENSE
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

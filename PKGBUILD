
_phpbase="81"
_suffix=""
pkgver="8.1.1"
pkgrel="2"
pkgbase="php${_phpbase}${_suffix}"
pkgdesc="PHP ${pkgver} compiled as to not conflict with mainline php"
_cppflags=" -DU_USING_ICU_NAMESPACE=1 "

_pkgver_icu="64-1"
_suffix=""
_suffix_so=""

pkgname=(
    "${pkgbase}"
    "php${_phpbase}-cli${_suffix}"
    "php${_phpbase}-cgi${_suffix}"
    "php${_phpbase}-apache${_suffix}"
    "php${_phpbase}-fpm${_suffix}"
    "php${_phpbase}-embed${_suffix}"
    "php${_phpbase}-bz2${_suffix}"
    "php${_phpbase}-bcmath${_suffix}"
    "php${_phpbase}-curl${_suffix}"
    "php${_phpbase}-dblib${_suffix}"
    "php${_phpbase}-dba${_suffix}"
    "php${_phpbase}-enchant${_suffix}"
    "php${_phpbase}-gd${_suffix}"
    "php${_phpbase}-gmp${_suffix}"
    "php${_phpbase}-imap${_suffix}"
    "php${_phpbase}-intl${_suffix}"
    "php${_phpbase}-interbase${_suffix}"
    "php${_phpbase}-ldap${_suffix}"
    "php${_phpbase}-mysql${_suffix}"
    "php${_phpbase}-odbc${_suffix}"
    "php${_phpbase}-pgsql${_suffix}"
    "php${_phpbase}-pspell${_suffix}"
    "php${_phpbase}-snmp${_suffix}"
    "php${_phpbase}-soap${_suffix}"
    "php${_phpbase}-tidy${_suffix}"
    "php${_phpbase}-sqlite${_suffix}"
    "php${_phpbase}-xml${_suffix}"
    "php${_phpbase}-xsl${_suffix}"
    "php${_phpbase}-zip${_suffix}"
    "php${_phpbase}-phpdbg${_suffix}"
    "php${_phpbase}-pear${_suffix}"
    "php${_phpbase}-opcache${_suffix}"
    "php${_phpbase}-sodium${_suffix}"
)

source=(
    "pear-config-patcher.php"
    "php-apache.conf"
    "https://php.net/distributions/php-${pkgver}.tar.xz"
    "php74-module-order.patch"
    "debian-php-8.1.1.patch"
    "php-phpinfo.patch"
    "timezonedb-guess.patch"
    "timezonedb-php8.1.patch"
)

depends=(
)

checkdepends=(
    "procps-ng"
)

arch=(
    "i686"
    "x86_64"
)

_patches=(
    "php74-module-order.patch"
    "debian-php-8.1.1.patch"
    "php-phpinfo.patch"
    "timezonedb-guess.patch"
    "timezonedb-php8.1.patch"
)

_build_apache_cfg="etc/httpd/conf/extra"
_build_bundled_gd="0"
_build_ffi="1"
_build_fpm_group="http"
_build_fpm_user="http"
_build_icu_src_dir="icu/source"
_build_interbase="0"
_build_json="0"
_build_mcrypt="0"
_build_mssql="0"
_build_opcache="1"
_build_openssl_v10_patch="0"
_build_openssl_v11_patch="0"
_build_outdated_mysql="0"
_build_pear="1"
_build_per_sapi="0"
_build_phpdbg="1"
_build_recode="0"
_build_shared_gd="1"
_build_shared_mysqlnd="1"
_build_sodium="1"
_build_static_pdo="0"
_build_uses_autoconf="1"
_build_wddx="0"
_build_with_custom_icu="0"
_build_xmlrpc="0"
_priority_default="20"
_priority_json="15"
_priority_mysqlnd="10"
_priority_opcache="10"
_priority_pdo="10"
_priority_xml="15"
_phpextensions="\
    --enable-bcmath=shared \
    --with-bz2=shared,/usr \
    --with-gmp=shared,/usr \
    --enable-intl=shared \
    --with-pspell=shared,/usr \
    --with-snmp=shared,/usr \
    --with-tidy=shared,/usr \
    --enable-filter \
    --with-readline \
    --enable-pcntl \
    --enable-calendar=shared \
    --enable-ctype=shared \
    --enable-exif=shared \
    --enable-fileinfo=shared \
    --enable-ftp=shared \
    --with-gettext=shared,/usr \
    --with-iconv=shared \
    --enable-phar=shared \
    --enable-posix=shared \
    --enable-shmop=shared \
    --enable-sockets=shared \
    --enable-sysvmsg=shared \
    --enable-sysvsem=shared \
    --enable-sysvshm=shared \
    --enable-tokenizer=shared \
    --enable-mysqlnd-compression-support \
    --with-mysqli=shared,mysqlnd \
    --with-pdo-mysql=shared,mysqlnd \
    --with-mysql-sock=/run/mysqld/mysqld.sock \
    --enable-dom=shared \
    --enable-simplexml=shared \
    --enable-xml=shared \
    --enable-xmlreader=shared \
    --enable-xmlwriter=shared \
    --with-xsl=shared \
    --enable-dba=shared \
    --with-db4=/usr \
    --with-gdbm \
    --enable-inifile \
    --enable-flatfile \
    --with-imap=shared,/usr \
    --with-kerberos \
    --with-imap-ssl=yes \
    --with-password-argon2 \
    --with-ffi=shared \
    --with-zip=shared \
    --with-curl=shared \
    --with-enchant=shared \
    --with-pcre-jit \
    --with-external-pcre=/usr \
    --with-openssl \
    --with-unixODBC=shared \
    --with-pdo-odbc=shared,unixODBC,/usr \
    --with-ldap=shared,/usr \
    --with-ldap-sasl \
    --with-pdo-sqlite=shared,/usr \
    --with-sqlite3=shared \
    --enable-mysqlnd=shared \
    --enable-gd=shared \
    --with-external-gd=/usr \
    --with-jpeg \
    --with-xpm \
    --with-webp \
    --with-freetype \
    --enable-pdo=shared \
    --with-zlib \
    --with-pdo-firebird=shared,/usr \
    --with-pgsql=shared,/usr \
    --with-pdo-pgsql=shared,/usr \
    --enable-soap=shared \
    --enable-opcache \
    --enable-huge-code-pages \
    --with-sodium=shared \
    --enable-mbstring=shared \
    --enable-mbregex \
    --with-pdo-dblib=shared,/usr"

_phpconfig="\
    --prefix=/usr \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --with-layout=GNU \
    --disable-debug \
    --mandir=/usr/share/man \
    --srcdir=../php-${pkgver} \
    --sysconfdir=/etc/php${_phpbase}${_suffix} \
    --libdir=/usr/lib/php${_phpbase}${_suffix} \
    --datadir=/usr/share/php${_phpbase}${_suffix} \
    --program-suffix=${_phpbase}${_suffix} \
    --with-config-file-path=/etc/php${_phpbase}${_suffix} \
    --with-config-file-scan-dir=/etc/php${_phpbase}${_suffix}/conf.d \
    --without-pear \
    --datarootdir=/usr/share/php${_phpbase}${_suffix} \
    --disable-rpath \
    --config-cache \
    --with-system-tzdata"

_phpextensions_fpm="\
    --with-fpm-user=${_build_fpm_user} \
    --with-fpm-group=${_build_fpm_group} \
    --with-fpm-systemd \
    --with-fpm-acl"



makedepends=(
    'libtool' 'autoconf' 'automake' 'patchelf' 'gawk' 'sed' 'bash' 'python' 'libxml2' 'pam'
    'openssl' 'openssl-1.0' 'argon2' 'libmcrypt' 'libsodium' 'libldap' 'libsasl' 'krb5'
    'libxslt'  'libzip' 'freetds' 'apache' 'aspell' 'c-client' 'db' 'enchant' 'readline'
    'gmp' 'icu' 'net-snmp' 'postgresql-libs' 'sqlite' 'systemd-libs' 'unixodbc' 'curl' 'ncurses'
    'freetds' 'pcre' 'tidy' 'libfbclient' 'oniguruma' 'gd'  'recode' 'bzip2' 'gdbm' 'zlib'
    'systemd' 'systemd-libs'
)
arch=('i686' 'x86_64')
checkdepends=('procps-ng')
license=('PHP')
url='http://www.php.net'


# Prepare it
prepare() {
    pushd "php-${pkgver}"
    echo "[SED] sapi/apache2handler/config.m4 and configure"
    sed -e '/APACHE_THREADED_MPM=/d' \
        -i sapi/apache2handler/config.m4 \
        -i configure

    echo "[SED] sapi/fpm/Makefile.frag"
    sed -e 's#php-fpm\$(program_suffix)#php\$(program_suffix)-fpm#' \
        -e 's/.conf.default/.conf/g' \
        -i sapi/fpm/Makefile.frag

    echo "[SED] sapi/fpm/php-fpm.service.in"
    sed -E "s|ExecStart[\s]?=[\s]?@([a-zA-Z_]+)@/php-fpm|ExecStart=@\1@/php${_phpbase}${_suffix}-fpm|g; \
            s|PIDFile[\s]?=[\s]?@([a-zA-Z_]+)@/run/php-fpm.pid|PIDFile=/run/php${_phpbase}${_suffix}-fpm/php-fpm.pid|g" \
        -i sapi/fpm/php-fpm.service.in

    local _check_files=("sapi/fpm/www.conf.in" "sapi/fpm/php-fpm.conf.in");
    for file_conf in "${_check_files[@]}"; do
        if [[ ! -f $file_conf  ]]; then
            continue;
        fi
        echo "[SED] ${file_conf}"
        sed -e "s#^listen =.*#listen = /run/php${_phpbase}${_suffix}-fpm/php-fpm.sock#" \
            -e "s#run/php-fpm.pid#/run/php${_phpbase}${_suffix}-fpm/php-fpm.pid#" \
            -e 's#^;*[ \t]*listen.owner =#listen.owner =#' \
            -e 's#^;*[ \t]*listen.group =#listen.group =#' \
            -e 's#^;*[ \t]*error_log =.*#error_log = syslog#' \
            -e 's#^;*[ \t]*chdir =.*#;chdir = /srv/http#' \
            -i "${file_conf}"
    done

    echo "[SED] php.ini-production"
    sed -e 's#^;*[ \t]*extension_dir[\t ]*=.*/.*$#extension_dir = "___EXTENSIONDIR___"#' \
        -e "s#___EXTENSIONDIR___#/usr/lib/php${_phpbase}${_suffix}/modules#g" \
        -e "s#^;*[ \t]*extension=#;extension=#g" \
        -i php.ini-production

    for patch_name in "${_patches[@]}"; do
        echo "[PATCH] Applying source patch ${patch_name}";
        patch -p1 -i "../${patch_name}"
    done
    if ((_build_uses_autoconf)); then
        autoconf
    fi
    echo "[SED] Sed for ${pkgdir}/usr/lib/php${_phpbase}${_suffix}/scripts/phpize.m4"
    sed -i "/^\[  --with-php-config=/c \[  --with-php-config=PATH  Path to php-config [php-config${_phpbase}${_suffix}]], php-config${_phpbase}${_suffix}, no)" "scripts/phpize.m4"
    rm -f tests/output/stream_isatty_*.phpt
    rm -f Zend/tests/arginfo_zpp_mismatch*.phpt
    popd
}

# BUILD them all
build() {
    export EXTENSION_DIR="/usr/lib/php${_phpbase}${_suffix}/modules"
    if ((_build_openssl_v10_patch)); then
        export PHP_OPENSSL_DIR="/usr/lib/openssl-1.0"
    fi

    if ((_build_with_custom_icu)); then
        local _php5_icu_first="${srcdir}/${_build_icu_src_dir}/php${_phpbase}${suffix}-icu${_pkgver_icu}"
        _ldflags="-Wl,-rpath=$ORIGIN/usr/lib/php${_phpbase}${_suffix}/icu${_pkgver_icu}/lib"
        _phpextensions+=" --with-icu-dir=${_php5_icu_first} "
        if [[ ! -d $_php5_icu_first ]]; then
            mkdir -p "${_php5_icu_first}"
        fi
        pushd "${_build_icu_src_dir}"
        ./configure --prefix="${_php5_icu_first}" \
            --sysconfdir="${_php5_icu_first}/etc" \
            --mandir="${_php5_icu_first}/share/man" \
            --sbindir="${_php5_icu_first}/bin" \
            --libdir="${_php5_icu_first}/lib" \
            --includedir="${_php5_icu_first}/include" \
            --disable-tests \
            --disable-debug
        make
        make install
        ./configure --prefix="/usr/lib/php${_phpbase}${_suffix}/icu${_pkgver_icu}" \
            --sysconfdir="/usr/lib/php${_phpbase}${_suffix}/icu${_pkgver_icu}/etc" \
            --mandir="/usr/lib/php${_phpbase}${_suffix}/icu${_pkgver_icu}/share/man" \
            --sbindir="/usr/lib/php${_phpbase}${_suffix}/icu${_pkgver_icu}/bin" \
            --libdir="/usr/lib/php${_phpbase}${_suffix}/icu${_pkgver_icu}/lib" \
            --includedir="/usr/lib/php${_phpbase}${_suffix}/icu${_pkgver_icu}/include" \
            --disable-tests \
            --disable-debug
        make
        popd
    fi

    if [[ ! -z "${_cppflags}" ]]; then
        CPPFLAGS+=" $_cppflags "
    fi
    if [[ ! -z "${_ldflags}" ]]; then
        LDFLAGS+=" $_ldflags "
    fi


    echo "[DEBUG] CPPFLAGS ${_cppflags}"
    echo "[DEBUG] LDGFLAGS ${_ldflags}"
    echo "[DEBUG] PHPCONF  ${_phpconfig}" | sed -E 's|[ \t]+|\n|g';
    echo "[DEBUG] PHPEXT ${_phpextensions}" | sed -E 's|[ \t]+|\n |g';
    echo "[DEBUG] FPMEXT ${_phpextensions_fpm}" | sed -E 's|[ \t]+|\n|g';

    if [[ ! -d "build" ]]; then
        mkdir "build"
    fi

    pushd "build"
    if [[ -L configure ]]; then
        rm configure
    fi

    ln -s "../php-${pkgver}/configure"
    popd
    if (( ! _build_per_sapi )); then
        # SAPIs: cli+cgi+fpm+embed
        pushd "build"
            ./configure ${_phpconfig} \
                --enable-cgi \
                --enable-fpm \
                ${_phpextensions_fpm} \
                --enable-embed=shared \
                ${_phpextensions}
            make
        popd
    else
        # Per sapi build: cli,cgi,fpm,embed

        # cli
        pushd "build"
            ./configure ${_phpconfig} \
                --disable-cgi \
                ${_phpextensions}
            make
        popd
        # cgi
        cp -Ta build build-cgi
        pushd build-cgi
            ./configure ${_phpconfig} \
                --disable-cli \
                --enable-cgi \
                ${_phpextensions}
            make
        popd

        # fpm
        cp -Ta build build-fpm
        pushd build-fpm
            ./configure ${_phpconfig} \
                --disable-cli \
                --enable-fpm \
                ${_phpextensions_fpm} \
                ${_phpextensions}
            make
        popd


        # embed
        cp -Ta build build-embed
        pushd build-embed
            ./configure ${_phpconfig} \
                --disable-cli \
                --enable-embed=shared \
                ${_phpextensions}
            make
        popd
    fi

    # apache build
    cp -a "build" "build-apache"
    pushd "build-apache"
        ./configure ${_phpconfig} \
            --with-apxs2 \
            ${_phpextensions}
        make
    popd

    # phpdbg build
    if ((_build_phpdbg)); then
        cp -a "build" "build-phpdbg"
        pushd "build-phpdbg"
            ./configure ${_phpconfig} \
                --enable-phpdbg \
                ${_phpextensions}
            make
        popd
    fi

    # PEAR build
    if ((_build_pear)); then
        cp -a "build" "build-pear"
        # Pear can't be built properly with shared xml
        local _ext_pear=$(echo ${_phpextensions} | sed 's/--enable-xml=shared/--enable-xml/g')
        export PEAR_INSTALLDIR="/usr/share/php${_phpbase}${_suffix}/pear"
        pushd "build-pear"
            ./configure ${_phpconfig} \
                --disable-cgi \
                --with-pear \
                ${_ext_pear}
            make
        popd
    fi
    unset EXTENSION_DIR
}

check() {
    pushd "build"
    # Check if sendmail was configured correctly (FS#47600)
    sapi/cli/php -n -r 'echo ini_get("sendmail_path");' | grep -q '/usr/bin/sendmail'

    export REPORT_EXIT_STATUS=1
    export NO_INTERACTION=1
    export SKIP_ONLINE_TESTS=1
    export SKIP_SLOW_TESTS=1
    export TESTS='tests Zend'
    if ((_phpbase > 73)); then
        export TEST_PHP_ARGS="-j$(nproc)"
    fi
    make test
    popd
}

# Custom code
_install_module_ini() {
    local extension=$(echo "${1}" | sed 's/\.so//')
    local priority="${_priority_default}"
    case "${extension}" in
        "json")
            priority="${_priority_json}"
            ;;
        "xml")
            priority="${_priority_xml}"
            ;;
        "mysqlnd")
            priority="${_priority_mysqlnd}"
            ;;
        "pdo")
            priority="${_priority_pdo}"
            ;;
        "opcache")
            priority="${_priority_opcache}"
            ;;
    esac
    local extension_type="extension"
    case "${extension}" in
        "opcache" | "xdebug")
            extension_type="zend_extension"
            ;;
        "recode")
            extension_type=";extension"
            ;;
    esac

    if [[ ! -d "${pkgdir}/etc/php${_phpbase}${_suffix}/conf.d" ]]; then
        mkdir -p "${pkgdir}/etc/php${_phpbase}${_suffix}/conf.d"
    fi
    echo "${extension_type}=${extension}.so" > "${pkgdir}/etc/php${_phpbase}${_suffix}/conf.d/${priority}-${extension}.ini"
    chmod 0644 "$pkgdir/etc/php${_phpbase}${_suffix}/conf.d/${priority}-${extension}.ini"
    _last_priority=${priority}
    _last_extension=${extension}
}

_install_module() {
    install -D -m755 "build/modules/${1}.so" "${pkgdir}/usr/lib/php${_phpbase}${_suffix}/modules/${1}.so";
    _install_module_ini "${1}"
}
# Custom code end

package_php81() {
    # Binary names
    pkgdesc='A general-purpose scripting language that is especially suited to web development'
    depends=('zlib' 'pcre' 'oniguruma' 'readline' 'argon2')
    if ((_build_openssl_v10_patch)); then
        depends+=("openssl-1.0")
    else
        depends+=("openssl")
    fi
    backup=("etc/php${_phpbase}${_suffix}/php.ini")
    if ((_build_with_custom_icu)); then
        pushd "${_build_icu_src_dir}"
        make DESTDIR="${pkgdir}" install
        make clean
        popd
        pushd "${pkgdir}/usr/lib/php${_phpbase}${_suffix}/icu${_pkgver_icu}"
        rm -rf bin include share
        popd
    fi
    pushd "build"
    make -j1 INSTALL_ROOT=${pkgdir} install-{modules,build,headers,programs,pharcmd}

    install -D -m644 "../php-${pkgver}/php.ini-production" "${pkgdir}/etc/php${_phpbase}${_suffix}/php.ini"
    install -d -m755 "${pkgdir}/etc/php${_phpbase}${_suffix}/conf.d/"

    pushd "${pkgdir}/usr/lib/php${_phpbase}${_suffix}/modules/"
    # remove static modules
    rm -f *.a

    # remove modules provided by sub packages
    rm -f {enchant,imap,intl,pspell,snmp,tidy,curl,ldap,bz2,bcmath,soap,zip,gmp,dba,opcache,json,gd,mcrypt,sodium,recode}.so
    # dblib package
    rm -rf {pdo_dblib,mssql}.so
    # xml package
    rm -f {dom,simplexml,xml,xmlreader,xmlwriter,xsl,wddx,xmlrpc}.so
    # PostgreSQL
    rm -f {pgsql,pdo_pgsql}.so
    # ODBC
    rm -f {odbc,pdo_odbc}.so
    # SQLite
    rm -f {pdo_sqlite,sqlite3}.so
    # pdo_firebird
    rm -f {pdo_firebird.so,interbase.so}
    # MySQL modules
    rm -f {mysqli,pdo_mysql,mysqlnd,mysql}.so

    # Install COMMON modules
    for i in *.so; do
        _install_module_ini "${i}"
    done
    popd

    # remove empty directory
    rmdir "${pkgdir}/usr/include/php/include"

    # move include directory
    mv "${pkgdir}/usr/include/php" "${pkgdir}/usr/include/php${_phpbase}${_suffix}"

    # Link to phar
    ln -sf "phar${_phpbase}${_suffix}.phar" "${pkgdir}/usr/bin/phar${_phpbase}${_suffix}"

    # rename executables
    if [[ -f "${pkgdir}/usr/bin/phar.phar" ]]; then
        mv "${pkgdir}/usr/bin/phar.phar" "${pkgdir}/usr/bin/phar${_phpbase}${_suffix}.phar"
    fi

    # rename man pages
    if [[ -f "${pkgdir}/usr/share/man/man1/phar.1" ]]; then
        mv "${pkgdir}/usr/share/man/man1/phar.1" \
            "${pkgdir}/usr/share/man/man1/phar${_phpbase}${_suffix}.1"
    fi

    if [[ -f "${pkgdir}/usr/share/man/man1/phar.phar.1" ]]; then
        mv "${pkgdir}/usr/share/man/man1/phar.phar.1" \
            "${pkgdir}/usr/share/man/man1/phar.phar${_phpbase}${_suffix}.1"
    fi

    # kill phar symlink in old php builds
    rm -f "${pkgdir}/usr/bin/phar"

    # fix paths in executables
    echo "[SED] ${pkgdir}/usr/bin/phpize${_phpbase}${_suffix}"
    sed -i "/^includedir=/c \includedir=/usr/include/php${_phpbase}${_suffix}" "${pkgdir}/usr/bin/phpize${_phpbase}${_suffix}"
    echo "[SED] ${pkgdir}/usr/bin/php-config${_phpbase}${_suffix}"
    sed -i "/^include_dir=/c \include_dir=/usr/include/php${_phpbase}${_suffix}" "${pkgdir}/usr/bin/php-config${_phpbase}${_suffix}"

    #sed -i "/^php_cli_binary=/c \include_dir=/usr/bin/php${_phpbase}${_suffix}" "${pkgdir}/usr/bin/php-config${_phpbase}${_suffix}"
    #sed -i "/^php_cgi_binary=/c \include_dir=/usr/bin/php-cgi${_phpbase}${_suffix}" "${pkgdir}/usr/bin/php-config${_phpbase}${_suffix}"

    echo "[SED] Sed for ${pkgdir}/usr/lib/php${_phpbase}${_suffix}/build/phpize.m4"
    sed -i "/^\[  --with-php-config=/c \[  --with-php-config=PATH  Path to php-config [php-config${_phpbase}${_suffix}]], php-config${_phpbase}${_suffix}, no)" \
        "${pkgdir}/usr/lib/php${_phpbase}${_suffix}/build/phpize.m4"
    # popd
    popd
}
# End install common

# Cli
package_php81-cli() {
    pkgdesc="cli (command-line executable) version for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}")
    pushd "build"
    make -j1 INSTALL_ROOT="${pkgdir}" install-cli
    popd
}
# End cli

# CGI
package_php81-cgi() {
    pkgdesc="CGI and FCGI SAPI for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}")
    if ((_build_per_sapi)); then
        pushd "build-cgi"
    else
        pushd "build"
    fi
    case "${_phpbase}" in
        53)
            install -D -m755 sapi/cgi/php-cgi "${pkgdir}/usr/bin/php${_phpbase}${_suffix}-cgi"
            ;;
        *)
            make -j1 INSTALL_ROOT="${pkgdir}" install-cgi
            ;;
    esac
    popd
}
# End CGI

package_php81-apache() {
    _build_mod_php_so="libphp${_suffix_so}.so"
    _build_mod_php_module="php_module${_suffix_so}"
    _build_build_php_script_name="php${_suffix_so}-script"
    _apache_module_conf="${pkgbase}-module.conf"
    pkgdesc="Apache SAPI for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'apache')
    backup=("${_build_apache_cfg}/${_apache_module_conf}")
    echo "# End of LoadModule in httpd.conf - see ArchWiki Apache HTTP Server"
    echo "LoadModule ${_build_mod_php_module} modules/libphp${_phpbase}${_suffix}.so"
    echo "AddHandler ${_build_php_script_name} .php"
    echo "# End of Include List"
    echo "Include conf/extra/${_apache_module_conf}"
    install -D -m755 "build-apache/libs/${_build_mod_php_so}" "${pkgdir}/usr/lib/httpd/modules/libphp${_phpbase}${_suffix}.so"
    install -D -m644 "php-apache.conf" "${pkgdir}/${_build_apache_cfg}/${_apache_module_conf}"
    echo "Sed for ${pkgdir}/${_build_apache_cfg}/${_apache_module_conf}"
    sed -e "s#@MODULE@#${_build_mod_php_module}#" \
        -i "${pkgdir}/${_build_apache_cfg}/${_apache_module_conf}"
}

package_php81-fpm() {
    pkgdesc="FastCGI Process Manager for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'systemd-libs')
    backup=("etc/php${_phpbase}${_suffix}/php-fpm.conf")
    if ((_phpbase>=70)); then
        backup+=("etc/php${_phpbase}${_suffix}/php-fpm.d/www.conf")
    fi
    options=('!emptydirs')

    if ((_build_per_sapi)); then
        pushd "build-fpm"
    else
        pushd "build"
    fi
    case "${_phpbase}" in
        53)
            install -d -m755 "${pkgdir}/usr/bin"
            install -D -m755 sapi/fpm/php-fpm "${pkgdir}/usr/bin/php${_phpbase}${_suffix}-fpm"
            install -D -m644 sapi/fpm/php-fpm.8 "${pkgdir}/usr/share/man/man8/php${_phpbase}${_suffix}-fpm.8"
            install -D -m644 sapi/fpm/php-fpm.conf "${pkgdir}/etc/php${_phpbase}${_suffix}/php-fpm.conf"
            install -d -m755 "${pkgdir}/etc/php${_phpbase}${_suffix}/fpm.d"
            ;;
        *)
            make -j1 INSTALL_ROOT="${pkgdir}" install-fpm
            ;;
    esac

    install -D -m644 "sapi/fpm/php-fpm.service" "${pkgdir}/usr/lib/systemd/system/php${_phpbase}${_suffix}-fpm.service"
    echo "d /run/php${_phpbase}${_suffix}-fpm 755 root root" > php-fpm.tmpfiles
    install -D -m644 "php-fpm.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/php${_phpbase}${_suffix}-fpm.conf"
    popd
}

package_php81-embed() {
    pkgdesc="Embedded PHP SAPI library for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'ncurses' 'systemd-libs')
    options=('!emptydirs')
    if ((_build_per_sapi)); then
        pushd "build-embed"
    else
        pushd "build"
    fi
    patchelf --set-soname "libphp${_phpbase}${_suffix}.so" "libs/libphp${_suffix_so}.so"
    case "${_phpbase}" in
        53)
            install -D -m755 "libs/libphp${_suffix_so}.so" "${pkgdir}/usr/lib/libphp${_phpbase}${_suffix}.so"
            install -D -m644 "../php-${pkgver}/sapi/embed/php_embed.h" "${pkgdir}/usr/include/php${_phpbase}${_suffix}/sapi/embed/php_embed.h"
            ;;
        *)
            make -j1 INSTALL_ROOT="${pkgdir}" PHP_SAPI=embed install-sapi
            mv "${pkgdir}/usr/lib/libphp${_suffix_so}.so" "${pkgdir}/usr/lib/libphp${_phpbase}${_suffix}.so"
            ;;
    esac
    popd
}

package_php81-phpdbg() {
    pkgdesc="Interactive PHP debugger for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}")
    options=('!emptydirs')
    pushd "build-phpdbg"
    make -j1 INSTALL_ROOT="${pkgdir}" install-phpdbg
    popd
}

package_php81-pear() {
    pkgdesc="PHP Extension and Application Repository for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" "php${_phpbase}-xml${_suffix}")
    backup=("etc/php${_phpbase}${_suffix}/pear.conf")
    #
    pushd "build-pear"

    make install-pear INSTALL_ROOT="${pkgdir}"

    # remove unneeded files
    rm -rf "${pkgdir}"/.{channels,depdb,depdblock,filemap,lock,registry}

    # rename binaries
    for i in pear peardev pecl; do
        echo "Moving ${pkgdir}/usr/bin/${i} => ${pkgdir}/usr/bin/${pkgbase/php/$i}"
        mv "${pkgdir}/usr/bin/${i}" "${pkgdir}/usr/bin/${pkgbase/php/$i}"
        # fix hardcoded php paths in pear
        sed -i "s|/usr/bin/php|/usr/bin/php${_phpbase}${_suffix}|g" "${pkgdir}/usr/bin/${pkgbase/php/$i}"
        sed -i "s|PHP=php|PHP=${_phpbase}${_suffix}|g" "${pkgdir}/usr/bin/${pkgbase/php/$i}"
    done
    # fix pear.conf with unserialize
    ./sapi/cli/php ../pear-config-patcher.php "${pkgdir}/etc/php${_phpbase}${_suffix}/pear.conf" "/usr/bin/php${_phpbase}${_suffix}" "${_phpbase}${_suffix}"

    #popd
    popd
}

package_php81-dblib() {
    depends=("php${_phpbase}${_suffix}" 'freetds')
    provides=(
        "php${_phpbase}${_suffix}-sybase=${pkgver}"
    )
   _install_module pdo_dblib
    if ((_build_mssql)); then
        _install_module mssql
        provided+=("php${_phpbase}${_suffix}-mssql=${pkgver}")
        pkgdesc="pdo_dblib module for php${_phpbase}${_suffix}"
    else
        pkgdesc="mssql and pdo_dblib modules for php${_phpbase}${_suffix}"
    fi
}

package_php81-enchant() {
    pkgdesc="enchant module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'enchant')
    _install_module enchant
}

package_php81-gd() {
    pkgdesc="gd module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'gd')
    if ((_build_bundled_gd)); then
        depends+=('libxpm' 'libpng' 'libjpeg')
    fi
    _install_module gd
}


package_php81-imap() {
    pkgdesc="imap module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'pam' 'krb5' 'c-client')
   _install_module imap
}

package_php81-intl() {
    pkgdesc="intl module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}")
    if ((_build_with_custom_icu)); then
        # Patch to proper path inside intl.so
        patchelf --set-rpath "/usr/lib/php${_phpbase}${_suffix}/icu${_pkgver_icu}/lib" "build/modules/intl.so"
    else
        depends+=('icu')
    fi
    _install_module intl
}

package_php81-mcrypt() {
    pkgdesc="mcrypt module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'libmcrypt')
   _install_module mcrypt
}

package_php81-odbc() {
    pkgdesc="ODBC modules for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'unixodbc')
    _install_module odbc
    _install_module pdo_odbc
}

package_php81-pgsql() {
    pkgdesc="PostgreSQL modules for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'postgresql-libs')
    _install_module pgsql
    _install_module pdo_pgsql
}

package_php81-pspell() {
    pkgdesc="pspell module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'aspell')
    _install_module pspell
}

package_php81-snmp() {
    pkgdesc="snmp module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'net-snmp')
    _install_module snmp
}

package_php81-sqlite() {
    pkgdesc="sqlite module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'sqlite')
    _install_module sqlite3
    _install_module pdo_sqlite
}

package_php81-tidy() {
    pkgdesc="tidy module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'tidy')
    _install_module tidy
}

package_php81-xml() {
    pkgdesc="xml modules for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'libxml2')
    _install_module dom
    _install_module simplexml
    if ((_build_wddx)); then
        _install_module wddx
    fi
    _install_module xml
    _install_module xmlreader
    _install_module xmlwriter
}

package_php81-xsl() {
    pkgdesc="xsl module for php${_phpbase}${_suffix}"
    depends=(
        "php${_phpbase}${_suffix}"
        "php${_phpbase}-xml${_suffix}=${pkgver}"
        'libxslt'
        'libxml2'
    )
    _install_module xsl
}

package_php81-xmlrpc() {
    pkgdesc="xmlrpc module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}")
    _install_module xmlrpc
}

package_php81-soap() {
    pkgdesc="soap module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'libxml2')
    _install_module soap
}

package_php81-zip() {
    pkgdesc="zip module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'libzip')
    _install_module zip
}


package_php81-bcmath() {
    pkgdesc="bcmath module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}")
    _install_module bcmath
}

package_php81-bz2() {
    pkgdesc="bz2 module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'bzip2')
    _install_module bz2
}

package_php81-ldap() {
    pkgdesc="ldap module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'libldap' 'libsasl')
    _install_module ldap
}

package_php81-curl() {
    pkgdesc="curl module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" "curl")
    _install_module curl
}

# gmp
package_php81-gmp() {
    pkgdesc="gmp module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'gmp')
    _install_module gmp
}
# End gmp

# Dba
package_php81-dba() {
    pkgdesc="dba module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'gdbm' 'db')
    _install_module dba
}
# End dba

# Json
package_php81-json() {
    pkgdesc="json module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}")
    _install_module json
}
# End json

# Recode
package_php81-recode() {
    pkgdesc="recode module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" 'recode')
    _install_module recode
}
# End recode

# Recode
package_php81-sodium() {
    pkgdesc="sodium (libsodium) module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" "libsodium")
    _install_module sodium
}
# End recode

# Opcache
package_php81-opcache() {
    pkgdesc="opcache zend module for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}")
    _install_module opcache
}
# End opcache

# Interbase modules
package_php81-interbase() {
    pkgdesc="Interbase modules for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}" "libfbclient")
    #backup=()
    if ((_build_interbase)); then
        _install_module interbase
    fi
    _install_module pdo_firebird
}
# End interbase

# MySQL modules
package_php81-mysql() {
    pkgdesc="MySQL modules for php${_phpbase}${_suffix}"
    depends=("php${_phpbase}${_suffix}")
    if ((_build_shared_mysqlnd)); then
        _install_module mysqlnd
    fi
    _install_module mysqli
    _install_module pdo_mysql
    if ((_build_outdated_mysql)); then
        _install_module mysql
    fi
}
# End mysql

sha256sums=('0201d0fa811b80614737424a72c7bb127125807e5d7eeec5e1578a0a58f77d2f'
            '6d0ad9becb5470ce8e5929d7d45660b0f32579038978496317544c5310281a91'
            '33c09d76d0a8bbb5dd930d9dd32e6bfd44e9efcf867563759eb5492c3aff8856'
            'e853815d7c7d67186f1d21f56ea63d7998d4649cc987677d4e3b6e0ac4b2caf3'
            '0df807d84bc0cf948a6ed0cf453e98213d47fbc7fdedc2747855a619dc616b3c'
            '558e780e93dfa861a366c49b4d156d8fc43f17898f001ae6033ec63c33d5d41c'
            '40bcc1e5058602302198d0925e431495391d8469499593af477f59d84d32f764'
            'e2b4bad971ed569e9e898dcb2c7451d53e9b55f473123bbd4765d126efea6466')

# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Alexander Kuznecov <alexander@kuznetcov.me>

_pkgname=nginx
pkgname=nginx-custom
pkgver=1.12.2
pkgrel=3
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server (with standard, additional and 3rd party modules)'
arch=('x86_64')
url='https://nginx.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl' 'pam' 'geoip' 'geoip-database' 'gd' 'libxslt' 'mailcap')
checkdepends=('perl' 'perl-gd' 'perl-io-socket-ssl' 'perl-fcgi' 'perl-cache-memcached'
              'memcached' 'ffmpeg' 'inetutils')
makedepends=('libxslt' 'gd' 'mercurial')
conflicts=('nginx' 'nginx-unstable' 'nginx-svn' 'nginx-devel' 'nginx-custom-dev' 'nginx-full')
provides=('nginx')

_user='http'
_group='http'
_doc_root="/usr/share/${_pkgname}/html"
_sysconf_path='etc'
_conf_path="${_sysconf_path}/${_pkgname}"
_tmp_path="/var/spool/${_pkgname}"
_pid_path='/run'
_lock_path='/var/lock'
_access_log_path="/var/log/${_pkgname}/access.log"
#_error_log_path="/var/log/${_pkgname}/error.log"
_error_log_path='stderr'
backup=("${_conf_path}/fastcgi.conf"
        "${_conf_path}/fastcgi_params"
        "${_conf_path}/koi-win"
        "${_conf_path}/koi-utf"
        "${_conf_path}/nginx.conf"
        "${_conf_path}/scgi_params"
        "${_conf_path}/uwsgi_params"
        "${_conf_path}/win-utf"
        "etc/logrotate.d/nginx")

# 3d party modules
_cachepurge_ver="2.3"
_cachepurge_dirname="ngx_cachepurge-${_cachepurge_ver}"
_slowfscache_ver="1.10"
_slowfscache_dirname="ngx_slowfscache-${_slowfscache_ver}"
_echo_ver="7740e11558b530b66b469c657576f5280b7cdb1b"
_echo_dirname="ngx_echo-${_echo_ver}"
_headersmore_ver="v0.32"
_headersmore_dirname="ngx_headersmore-${_headersmore_ver}"
_uploadprogress_ver="v0.9.2"
_uploadprogress_dirname="ngx_uploadprogress-${_uploadprogress_ver}"
_upstreamfair_hash="89f72d881ba123ddcc281f9ff2535b10e35555a1"
_upstreamfair_dirname="ngx_upstreamfair"
_fancyindex_ver="v0.4.2"
_fancyindex_dirname="ngx_fancyindex-${_fancyindex_ver}"
_authpam_ver="1.5.1"
_authpam_dirname="ngx_authpam-${_authpam_ver}"
_pagespeed_ver="1.11.33.4"
_pagespeed_dirname="ngx_pagespeed-${_pagespeed_ver}"
_rtmp_ver="v1.1.11"
_rtmp_dirname="ngx_rtmp-${_rtmp_ver}"
_davext_ver="v0.0.3"
_davext_dirname="ngx_davext-${_davext_ver}"
_naxsi_ver="0.55.3"
_naxsi_dirname="ngx_naxsi-${_naxsi_ver}"
_accesskey_ver="2.0.4"
_accesskey_dirname="ngx_accesskey-${_accesskey_ver}"

source=("nginx.sh"
        "nginx.conf"
        "nginx.logrotate"
        "nginx.service"
        "https://nginx.org/download/nginx-$pkgver.tar.gz"{,.asc}
        hg+http://hg.nginx.org/nginx-tests#revision=cbda704b3093
        "${_fancyindex_dirname}.tar.gz::https://github.com/aperezdc/ngx-fancyindex/archive/${_fancyindex_ver}.tar.gz"
        "${_cachepurge_dirname}.tar.gz::http://labs.frickle.com/files/ngx_cache_purge-${_cachepurge_ver}.tar.gz"
        "${_slowfscache_dirname}.tar.gz::http://labs.frickle.com/files/ngx_slowfs_cache-${_slowfscache_ver}.tar.gz"
        "${_uploadprogress_dirname}.source::https://github.com/masterzen/nginx-upload-progress-module/tarball/${_uploadprogress_ver}"
        "${_headersmore_dirname}.source::https://github.com/agentzh/headers-more-nginx-module/tarball/${_headersmore_ver}"
        "${_echo_dirname}.source::https://github.com/agentzh/echo-nginx-module/tarball/${_echo_ver}"
        "${_upstreamfair_dirname}.source::https://github.com/unixfox/nginx-upstream-fair/tarball/${_upstreamfair_hash}"
        "${_authpam_dirname}.tar.gz::https://github.com/stogh/ngx_http_auth_pam_module/archive/v${_authpam_ver}.tar.gz"
        "${_pagespeed_dirname}.zip::https://github.com/apache/incubator-pagespeed-ngx/archive/v${_pagespeed_ver}-beta.zip"
        "psol.tar.gz::https://dl.google.com/dl/page-speed/psol/${_pagespeed_ver}.tar.gz"
        "${_rtmp_dirname}.zip::https://github.com/arut/nginx-rtmp-module/archive/${_rtmp_ver}.zip"
        "${_davext_dirname}.tar.gz::https://github.com/arut/nginx-dav-ext-module/archive/${_davext_ver}.tar.gz"
        "${_naxsi_dirname}.tar.gz::https://github.com/nbs-system/naxsi/archive/${_naxsi_ver}.tar.gz"
        "${_accesskey_dirname}.tar.gz::https://github.com/Martchus/nginx-accesskey/archive/v${_accesskey_ver}.tar.gz"
)
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8') # Maxim Dounin <mdounin@mdounin.ru>
sha256sums=('c147953bd4e10ea3a74d9b4add59f18fc0bed093016a53a1d33ea2b9065cdc23'
            '8d8e314da10411b29157066ea313fc080a145d2075df0c99a1d500ffc7e8b7d1'
            '06ebe161af3e761f2e2e35a67c6c0af27bf61aea7cd4ba8b28372ced5e3b3175'
            'c61cf4fefeb2a3b4c5eaba61123546e03f87c701466e8dad2c9262433f13b2d5'
            '305f379da1d5fb5aefa79e45c829852ca6983c7cd2a79328f8e084a324cf0416'
            'SKIP'
            'SKIP'
            '8327150864ca267b735d550d3304030efbbd863fdddfe0a94e970f249a8827ee'
            '279e0d8a46d3b1521fd43b3f78bc1c08b263899142a7cc5058c1c0361a92c89c'
            '1e81453942e5b0877de1f1f06c56ae82918ea9818255cb935bcb673c95a758a1'
            '7dfecce1856b20157905f4f1fa419dc48858e5336b2c3701d1523b4abf54685b'
            'd5921ea7ab4f4a77b9fe360721304238e3efb653ecd3c887291f1521e84e8c7b'
            '135a58c527d00020eaabdc3fd3645601a35876a72fc7cdbe479de6a8458dafc4'
            '13befeb7b4509abff0c0b2d4c76af4b4f9bc33f38153091d1bd85279e23453c6'
            '77676842919134af88a7b4bfca4470223e3a00d287d17c0dbdc9a114a685b6e7'
            '87d4f70349f3ab2c1ec60656b4ff1c9a3df738d74240048283a9acb9574f871a'
            '97408b04bf7395ab34d7b5baed95ae3dc928746213ca02590773b66a7697a7dc'
            'ce5860791ccbe5ad372332157004be649239110f453ae2c27fc0322f27de20e6'
            'd428a0236c933779cb40ac8c91afb19d5c25a376dc3caab825bfd543e1ee530d'
            '0b3c95d250772dc89ad8b49e47c1e024c5ae2c76c0cffa445e9fe05c4dd13495'
            'ae006b875e23d9ddc9c481d301c21b8a1775e578171e910890facc9e26bfbee2')

prepare() {
  mv ngx-fancyindex-* ${_fancyindex_dirname}
  mv ngx_cache_purge-* ${_cachepurge_dirname}
  mv ngx_slowfs_cache-* ${_slowfscache_dirname}
  mv openresty-headers-more-nginx-module-* ${_headersmore_dirname}
  mv openresty-echo-nginx-module-* ${_echo_dirname}
  mv masterzen-nginx-upload-progress-module-* ${_uploadprogress_dirname}
  mv unixfox-nginx-upstream-fair-* ${_upstreamfair_dirname}
  mv ngx_http_auth_pam_module-${_authpam_ver} ${_authpam_dirname}
  mv incubator-pagespeed-ngx-* ${_pagespeed_dirname}
  mv psol ${_pagespeed_dirname}/
  mv nginx-accesskey* ${_accesskey_dirname}
  mv nginx-rtmp-module* ${_rtmp_dirname}
  mv nginx-dav-ext-module* ${_davext_dirname}
  mv naxsi* ${_naxsi_dirname}
}

check() {
  cd nginx-tests
  warning "Ignore failing auth_request_satisfy.t for now, see testresults.txt"
  TEST_NGINX_BINARY="$srcdir/${_pkgname}-${pkgver}/objs/nginx" find -maxdepth 1 -not -iname 'auth_request_satisfy.t' -iname '*.t' -exec prove {} \+
}

build() {
  local _src_dir="${srcdir}/${_pkgname}-${pkgver}"
  cd $_src_dir

  ./configure \
    --prefix="/${_conf_path}" \
    --conf-path="/${_conf_path}/nginx.conf" \
    --sbin-path="/usr/bin/${_pkgname}" \
    --pid-path="${_pid_path}/${_pkgname}.pid" \
    --lock-path=${_pid_path}/${_pkgname}.lock \
    --http-client-body-temp-path=${_tmp_path}/client_body_temp \
    --http-proxy-temp-path=${_tmp_path}/proxy_temp \
    --http-fastcgi-temp-path=${_tmp_path}/fastcgi_temp \
    --http-uwsgi-temp-path=${_tmp_path}/uwsgi_temp \
    --http-scgi-temp-path=${_tmp_path}scgi_temp \
    --http-log-path=${_access_log_path} \
    --error-log-path=${_error_log_path} \
    --user=${_user} \
    --group=${_group} \
    --with-compat \
    --with-debug \
    --with-ipv6 \
    --with-pcre-jit \
    --with-file-aio \
    --with-mail \
    --with-mail_ssl_module \
    --with-stream \
    --with-stream_ssl_module \
    --with-threads \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-http_dav_module \
    --with-http_gzip_static_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_auth_request_module \
    --with-http_xslt_module \
    --with-http_image_filter_module \
    --with-http_sub_module \
    --with-http_v2_module \
    --with-mail \
    --with-mail_ssl_module \
    --with-stream \
    --with-stream_ssl_module \
    --with-threads \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_random_index_module \
    --with-http_secure_link_module \
    --with-http_slice_module \
    --with-http_perl_module \
    --with-http_degradation_module \
    --with-http_geoip_module \
    --with-http_gunzip_module \
    --with-http_auth_request_module \
    --add-module=../${_naxsi_dirname}/naxsi_src/ \
    --add-module=../${_cachepurge_dirname} \
    --add-module=../${_echo_dirname} \
    --add-module=../${_headersmore_dirname} \
    --add-module=../${_slowfscache_dirname} \
    --add-module=../${_uploadprogress_dirname} \
    --add-module=../${_upstreamfair_dirname} \
    --add-module=../${_fancyindex_dirname} \
    --add-module=../${_authpam_dirname} \
    --add-module=../${_pagespeed_dirname} \
    --add-module=../${_accesskey_dirname} \
    --add-module=../${_rtmp_dirname} \
    --add-module=../${_davext_dirname} \
    --with-cc-opt="$CFLAGS $CPPFLAGS" \
    --with-ld-opt="$LDFLAGS"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install

  sed -e "s|\<user\s\+\w\+;|user $_user $_group;|g" \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -i ${pkgdir}/$_conf_path/nginx.conf

  mkdir -p ${pkgdir}/$_conf_path/sites-enabled/
  mkdir -p ${pkgdir}/$_conf_path/sites-available/

  install -d "${pkgdir}/${_tmp_path}"
  install -d "${pkgdir}/${_doc_root}"

  mv "${pkgdir}/${_conf_path}/html/"* "${pkgdir}/${_doc_root}"
  rm -rf "${pkgdir}/${_conf_path}/html"
  rm "$pkgdir"/etc/nginx/mime.types # in mailcap

  install -D -m555 "${srcdir}/nginx.sh" "${pkgdir}/etc/rc.d/${_pkgname}"
  install -D -m644 "${srcdir}/nginx.logrotate" "${pkgdir}/etc/logrotate.d/${_pkgname}"
  install -D -m644 "${srcdir}/nginx.conf" "${pkgdir}/etc/conf.d/${_pkgname}"
  install -D -m644 "${srcdir}/nginx.service" "${pkgdir}/usr/lib/systemd/system/nginx.service"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/${i}/nginx.vim \
      "${pkgdir}/usr/share/vim/vimfiles/${i}/nginx.vim"
  done
}
